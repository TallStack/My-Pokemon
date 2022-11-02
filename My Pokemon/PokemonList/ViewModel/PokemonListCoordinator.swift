//
//  PokemonListCoordinator.swift
//  My Pokemon
//
//  Created by Keketso Ramosedi on 2022/10/28.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//

import UIKit

final class PokemonListCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = PokemonListViewModel(coordinator: self)
        let pokemonListVC = PokemonListViewController(viewModel: viewModel)
        //let pokemonListVC = PokemonListViewController()
        navigationController.pushViewController(pokemonListVC, animated: true)
    }
}

extension PokemonListCoordinator: PokemonListCoordinatorProtocol {

    func showDetail(for pokemonDetail: PokemonDetail) {
        let pokemonDetail = PokemonDetailCoordinator(
            navigationController: navigationController,
            detail: pokemonDetail
        )
        coordinate(to: pokemonDetail)
    }
}
