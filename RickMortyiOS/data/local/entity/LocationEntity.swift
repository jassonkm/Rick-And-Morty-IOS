//
//  LocationEntity.swift
//  RickAndMortyiOS
//
//  Created by Yeison Maldonado on 7/11/25.
//
import SwiftData
@Model
class LocationEntity {
    var name: String
    var url: String

    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}
