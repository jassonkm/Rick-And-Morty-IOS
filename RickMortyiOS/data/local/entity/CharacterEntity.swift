//
//  CharacterEntity.swift
//  RickAndMortyiOS
//
//  Created by Yeison Maldonado on 7/11/25.
//
import SwiftData
import Foundation

@Model
final class CharacterEntity: Identifiable {
    @Attribute var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: LocationEntity
    var location: LocationEntity
    var image: String
    var page: Int?
    init(id: Int, name: String, status: String, species: String, type: String, gender: String, origin: LocationEntity, location: LocationEntity, image: String, page: Int? = nil) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.page = page
    }
    
}
