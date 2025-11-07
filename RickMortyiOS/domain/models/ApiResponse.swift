//
//  ApiResponse.swift
//  RickAndMortyiOS
//
//  Created by Yeison Maldonado on 7/11/25.
//
struct ApiResponse: Codable {
    let results: [CharacterResponse]
}
struct CharacterResponse: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: LocationResponse
    let location: LocationResponse
    let image: String
}

struct LocationResponse: Codable {
    let name: String
    let url: String
}

// MARK: - Mappers
extension CharacterResponse {
    func toDomain(page: Int?) -> Character {
        Character(
            id: id,
            name: name,
            status: status,
            species: species,
            type: type,
            gender: gender,
            origin: Location(name: origin.name, url: origin.url),
            location: Location(name: location.name, url: location.url),
            image: image,
            page: page
        )
    }
}
