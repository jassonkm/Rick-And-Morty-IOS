//
//  CharacterRow.swift
//  RickAndMortyiOS
//
//  Created by Yeison Maldonado on 7/11/25.
//

import SwiftUI

struct CharacterRow: View {
    let character: Character

    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 70, height: 70)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.blue.opacity(0.4), lineWidth: 2)
            )
            .shadow(color: .gray.opacity(0.4), radius: 4, x: 0, y: 2)

            VStack(alignment: .leading, spacing: 6) {
                Text(character.name)
                    .font(.headline)
                    .foregroundColor(.primary)

                Text("\(character.species) • \(character.status)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 3)
        )
        .padding(.horizontal)
    }
}
