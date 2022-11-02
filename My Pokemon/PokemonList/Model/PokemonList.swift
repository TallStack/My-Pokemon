//
//  PokemonList.swift
//  My Pokemon
//
//  Created by Keketso Ramosedi on 2022/10/28.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//

import Foundation
struct PokemonList: Decodable {

    let results: [Pokemon]?
    
    init(results: [Pokemon]? = []) {
        self.results = results
    }
}
