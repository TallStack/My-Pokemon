//
//  PokemonListViewProtocol.swift
//  My Pokemon
//
//  Created by Keketso Ramosedi on 2022/10/28.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//

import UIKit

protocol PokemonListViewProtocol: AnyObject {

    func reloadCollectionView()
    func showLoading(_ show: Bool)
}
