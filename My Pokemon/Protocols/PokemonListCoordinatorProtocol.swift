//
//  PokemonListCoordinatorProtocol.swift
//  My Pokemon
//
//  Created by Keketso Ramosedi on 2022/10/31.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//

import Foundation
protocol PokemonListCoordinatorProtocol: AnyObject, ShowAlert {

    func showDetail(for pokemonDetail: PokemonDetail)
}
