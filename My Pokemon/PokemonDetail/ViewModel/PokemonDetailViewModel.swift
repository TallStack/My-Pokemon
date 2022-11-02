//
//  PokemonDetailViewModel.swift
//  My Pokemon
//
//  Created by Keketso Ramosedi on 2022/10/28.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//

import Foundation
final class PokemonDetailViewModel {
    
    weak var view: PokemonDetailViewProtocol?
    
    private var coordinator: PokemonDetailCoordinatorProtocol?
    private var detail: PokemonDetail

    init(coordinator: PokemonDetailCoordinatorProtocol,
         detail: PokemonDetail) {
        self.coordinator = coordinator
        self.detail = detail
    }
}

extension PokemonDetailViewModel: PokemonDetailViewModelProtocol {

    var pokemonDetail: PokemonDetail { return detail }
}
