//
//  PokemonDetailViewController.swift
//  My Pokemon
//
//  Created by Keketso Ramosedi on 2022/10/28.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//

import UIKit

final class PokemonDetailViewController: UIViewController {
        
    private var viewModel: PokemonDetailViewModelProtocol!
    private var contentView: PokemonDetailView!

    init(viewModel: PokemonDetailViewModelProtocol) {
        self.viewModel = viewModel
        self.contentView = PokemonDetailView(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = contentView
    }
}
