//
//  CharacterListView.swift
//  RickAndMortyiOS
//
//  Created by Yeison Maldonado on 7/11/25.
//
import SwiftUI

struct CharacterListView: View {
    @StateObject private var viewModel = CharacterViewModel(
        getCharactersUseCase: Dependencies.shared.getCharactersUseCase
    )

    var body: some View {
        NavigationStack {
            ZStack {
                // Fondo sutil
                LinearGradient(
                    colors: [.white, Color(.systemGray6)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack(spacing: 0) {
                    // Encabezado grande
                    Text("Rick & Morty")
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.top, .horizontal])
                        .foregroundColor(.primary)

                    ScrollView {
                        LazyVStack(spacing: 12) {
                            switch viewModel.state {
                            case .loading:
                                ProgressView("Cargando personajes...")
                                    .padding()

                            case .error(let message):
                                VStack(spacing: 16) {
                                    Text(message)
                                        .foregroundColor(.red)
                                    Button("Reintentar") {
                                        Task { await viewModel.loadCharacters(reset: true) }
                                    }
                                    .buttonStyle(.borderedProminent)
                                }

                            case .success(let characters):
                                ForEach(characters) { character in
                                    NavigationLink(value: character) {
                                        CharacterRow(character: character)
                                            .onAppear {
                                                Task {
                                                    await viewModel.loadNextPageIfNeeded(currentItem: character)
                                                }
                                            }
                                    }
                                    .buttonStyle(.plain) // Evita el color azul predeterminado
                                }

                                if viewModel.isLoadingMore {
                                    ProgressView("Cargando más...")
                                        .padding(.vertical)
                                }
                            }
                        }
                        .padding(.top, 8)
                    }
                }
            }
            .navigationDestination(for: Character.self) { character in
                    CharacterDetailView(character: character)
            }
            .task {
                await viewModel.loadCharacters(reset: true)
            }
        }
    }
}

