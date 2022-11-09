//
//  PokemonTableViewController.swift
//  My Pokemon
//
//  Created by Keketso Ramosedi on 2022/11/08.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//

import UIKit

class PokemonTableViewController: UIViewController {

//    private var contentView: PokemonTableView!
//
//    init() {
//        self.contentView = PokemonTableView()
//        super.init(nibName: nil, bundle: nil)
//    }
    
    private var contentView: PokemonTableView!
    private var viewModel: PokemonListViewModelProtocol!
    init(viewModel: PokemonListViewModelProtocol) {
        self.viewModel = viewModel
        self.contentView = PokemonTableView(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = contentView
        title = TitleString.TitleText.localizedText//"My Pokemon"
        setCustomStyle()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.fetchPokemonList()
    }

    private func setCustomStyle() {
        let font = UIFont(name: "Arial", size: 16) ?? .systemFont(ofSize: 16)
        navigationController?.navigationBar.titleTextAttributes = [.font: font]
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]

        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self])
            .setTitleTextAttributes([.font: font], for: .normal)
        
        view.backgroundColor = .systemBackground
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

