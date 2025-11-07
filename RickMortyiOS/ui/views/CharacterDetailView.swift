//
//  CharacterDetailView.swift
//  RickAndMortyiOS
//
//  Created by Yeison Maldonado on 7/11/25.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                AsyncImage(url: URL(string: character.image)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 6)
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 300)
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 12) {
                    Text(character.name)
                        .font(.title.bold())

                    Label(character.status, systemImage: "heart.fill")
                        .foregroundColor(character.status.lowercased() == "alive" ? .green : .red)
                        .font(.headline)

                    Divider()

                    VStack(alignment: .leading, spacing: 6) {
                        Text("Species: \(character.species)")
                        Text("Gender: \(character.gender)")
                        Text("Origin: \(character.origin.name)")
                        Text("Location: \(character.location.name)")
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

