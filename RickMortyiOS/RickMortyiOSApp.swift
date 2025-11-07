//
//  RickMortyiOSApp.swift
//  RickMortyiOS
//
//  Created by Yeison Maldonado on 7/11/25.
//

import SwiftUI
import SwiftData

@main
struct RickMortyiOSApp: App {
    var body: some Scene {
        WindowGroup {
            CharacterListView()
        }
        .modelContainer(for: [CharacterEntity.self, LocationEntity.self])
    }
}
