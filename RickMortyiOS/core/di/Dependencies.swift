//
//  Dependencies.swift
//  RickAndMortyiOS
//
//  Created by Yeison Maldonado on 7/11/25.
//
import Foundation
import SwiftData

@MainActor
final class Dependencies {
    static let shared = Dependencies()
    private init() {}

    // SwiftData
    lazy var modelContainer: ModelContainer = {
        try! ModelContainer(for: CharacterEntity.self, LocationEntity.self)
    }()

    lazy var modelContext: ModelContext = {
        ModelContext(modelContainer)
    }()

    // Repository
    lazy var repository: CharacterRepository = {
        CharacterRepository(context: modelContext)
    }()

    // Use Case
    lazy var getCharactersUseCase: GetCharactersUseCase = {
        GetCharactersUseCase(repository: repository)
    }()
}

