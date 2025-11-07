//
//  CharacterRepository.swift
//  RickAndMortyiOS
//
//  Created by Yeison Maldonado on 7/11/25.
//
import Foundation
import SwiftData

@MainActor
final class CharacterRepository {
    private let context: ModelContext
    private let remote = RemoteDataSource()

    init(context: ModelContext) {
        self.context = context
    }

    func getCharacters(page: Int? = nil) async throws -> [Character] {
        do {
            let remoteCharacters = try await remote.fetchCharacters(page: page)
            saveCharacters(remoteCharacters, page: page)
            return remoteCharacters
        } catch {
            return fetchLocalCharacters(page: page)
        }
    }

    private func saveCharacters(_ characters: [Character], page: Int?) {
        for c in characters {
            let origin = LocationEntity(name: c.origin.name, url: c.origin.url)
            let location = LocationEntity(name: c.location.name, url: c.location.url)
            let entity = CharacterEntity(
                id: c.id,
                name: c.name,
                status: c.status,
                species: c.species,
                type: c.type,
                gender: c.gender,
                origin: origin,
                location: location,
                image: c.image,
                page: page
            )
            context.insert(entity)
        }
        try? context.save()
    }

    private func fetchLocalCharacters(page: Int? = nil) -> [Character] {
        var descriptor = FetchDescriptor<CharacterEntity>()
        if let page = page {
            descriptor.predicate = #Predicate { $0.page == page }
        }

        guard let entities = try? context.fetch(descriptor) else { return [] }

        return entities.map {
            Character(
                id: $0.id,
                name: $0.name,
                status: $0.status,
                species: $0.species,
                type: $0.type,
                gender: $0.gender,
                origin: Location(name: $0.origin.name, url: $0.origin.url),
                location: Location(name: $0.location.name, url: $0.location.url),
                image: $0.image,
                page: $0.page
            )
        }
    }
}

