//
//  CharacterViewModel.swift
//  RickAndMortyiOS
//
//  Created by Yeison Maldonado on 7/11/25.
//
import Foundation

@MainActor
final class CharacterViewModel: ObservableObject {
    @Published var state: UiState<[Character]> = .loading
    @Published var isLoadingMore = false

    private let getCharactersUseCase: GetCharactersUseCase
    private var currentPage = 1
    private var canLoadMore = true
    private var characters: [Character] = []
    private var isFetching = false

    init(getCharactersUseCase: GetCharactersUseCase) {
        self.getCharactersUseCase = getCharactersUseCase
    }

    func loadCharacters(reset: Bool = false) async {
        guard !isFetching else { return }
        isFetching = true

        if reset {
            currentPage = 1
            canLoadMore = true
            characters.removeAll()
            state = .loading
        }

        do {
            let newCharacters = try await getCharactersUseCase.execute(page: currentPage)

            if newCharacters.isEmpty {
                canLoadMore = false
            } else {
                let uniqueNew = newCharacters.filter { newChar in
                    !characters.contains(where: { $0.id == newChar.id })
                }

                characters.append(contentsOf: uniqueNew)
                state = .success(characters)
                currentPage += 1
            }

        } catch {
            if case .success(let cached) = state, !cached.isEmpty {
                state = .success(cached)
            } else {
                state = .error("No se pudieron cargar los personajes.")
            }
        }

        isFetching = false
    }

    func loadNextPageIfNeeded(currentItem character: Character) async {
        guard case .success(let allChars) = state else { return }
        guard canLoadMore, !isFetching else { return }

        let thresholdIndex = allChars.index(allChars.endIndex, offsetBy: -5, limitedBy: allChars.startIndex) ?? allChars.startIndex
        if allChars.firstIndex(where: { $0.id == character.id }) == thresholdIndex {
            isLoadingMore = true
            await loadCharacters()
            isLoadingMore = false
        }
    }
}

