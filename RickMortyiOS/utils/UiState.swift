//
//  UiState.swift
//  RickAndMortyiOS
//
//  Created by Yeison Maldonado on 7/11/25.
//

enum UiState<T> {
    case loading
    case success(T)
    case error(String)
}
