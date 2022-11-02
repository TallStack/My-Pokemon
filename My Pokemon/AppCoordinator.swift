//
//  AppCoordinator.swift
//  My Pokemon
//
//  Created by Keketso Ramosedi on 2022/10/29.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//
import UIKit

final class AppCoordinator: CoordinatorProtocol {
    
    let navigationController: UINavigationController
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        self.showPokemonList()
    }
    
    private func showPokemonList() {
        let startCoordinator = PokemonListCoordinator(navigationController: navigationController)
        coordinate(to: startCoordinator)
    }
}
