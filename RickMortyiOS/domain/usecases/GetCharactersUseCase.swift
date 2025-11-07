//
//  GetCharactersUseCase.swift
//  RickAndMortyiOS
//
//  Created by Yeison Maldonado on 7/11/25.
//

import Foundation

struct GetCharactersUseCase {
    private let repository: CharacterRepository

    init(repository: CharacterRepository) {
        self.repository = repository
    }

    func execute(page: Int? = nil) async throws -> [Character] {
        try await repository.getCharacters(page: page)
    }
}


