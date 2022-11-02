//
//  PokemonListServiceProtocol.swift
//  My Pokemon
//
//  Created by Keketso Ramosedi on 2022/10/28.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//

import Foundation
protocol PokemonListServiceProtocol {

    func getPokemonList(onComplete: @escaping (Result<PokemonList, APIError>) -> Void)
    func getPokemon(id: String, onComplete: @escaping (Result<PokemonDetail, APIError>) -> Void)
}
