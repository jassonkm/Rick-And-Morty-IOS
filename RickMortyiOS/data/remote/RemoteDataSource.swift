//
//  RemoteDataSource.swift
//  RickAndMortyiOS
//
//  Created by Yeison Maldonado on 7/11/25.
//
import Foundation

struct RemoteDataSource {
    private let baseUrl = URL(string: "https://rickandmortyapi.com/api/character")!
    
    func fetchCharacters(page: Int? = nil) async throws -> [Character] {
        var url = baseUrl
        if let page {
            url = URL(string: "\(baseUrl)?page=\(page)")!
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(ApiResponse.self, from: data)
        return response.results.map { $0.toDomain(page: page) }
    }
}

