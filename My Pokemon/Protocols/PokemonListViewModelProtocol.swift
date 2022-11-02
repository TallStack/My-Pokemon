//
//  PokemonListViewModelProtocol.swift
//  My Pokemon
//
//  Created by Keketso Ramosedi on 2022/10/28.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//

import Foundation
protocol PokemonListViewModelProtocol
{

    var view: PokemonListViewProtocol? { get set }
    var countPokemons: Int { get }
    
    func fetchPokemonList()
    func fetchPokemon(by id: String)
    func openDetailFor(indexPath: IndexPath)
    func cellViewModelFor(at indexPath: IndexPath) -> PokemonCellViewModel
}
