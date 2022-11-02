//
//  PokemonDetailCoordinator.swift
//  My Pokemon
//
//  Created by Keketso Ramosedi on 2022/10/28.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//

import UIKit

final class PokemonDetailCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    private var detail: PokemonDetail

    init(navigationController: UINavigationController,
         detail: PokemonDetail) {
        self.navigationController = navigationController
        self.detail = detail
    }
    
    func start() {
        let viewModel = PokemonDetailViewModel(coordinator: self, detail: detail)
        let pokemonDetailVC = PokemonDetailViewController(viewModel: viewModel)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.present(pokemonDetailVC, animated: true, completion: nil)
    }
}

extension PokemonDetailCoordinator: PokemonDetailCoordinatorProtocol {}
