//
//  PokemonCellViewModel.swift
//  My Pokemon
//
//  Created by Keketso Ramosedi on 2022/10/28.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//

import UIKit
final class PokemonCellViewModel {
    
    private var pokemon: Pokemon
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
    var name: String {
        return pokemon.name.capitalized
    }

    var id: String {
        return pokemon.id ?? ""
    }
}
