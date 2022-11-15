//
//  PokemonTableView.swift
//  My Pokemon
//
//  Created by Keketso Ramosedi on 2022/11/08.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//

import UIKit

class PokemonTableView: UIView {

    let photos = [["https://github.com/TallStack/MinoxBeard/blob/master/MinoxBeard/MinoxBeard/Assets/Images/beard3.jpg?raw=true", "https://github.com/TallStack/MinoxBeard/blob/master/MinoxBeard/MinoxBeard/Assets/Images/beard3.jpg?raw=true", "https://github.com/TallStack/MinoxBeard/blob/master/MinoxBeard/MinoxBeard/Assets/Images/beard3.jpg?raw=true"],
                  
        ["https://github.com/TallStack/MinoxBeard/blob/master/MinoxBeard/MinoxBeard/Assets/Images/beard2.jpg?raw=true",
         "https://github.com/TallStack/MinoxBeard/blob/master/MinoxBeard/MinoxBeard/Assets/Images/beard2.jpg?raw=true",
         "https://github.com/TallStack/MinoxBeard/blob/master/MinoxBeard/MinoxBeard/Assets/Images/beard2.jpg?raw=true"],
                  
        ["https://github.com/TallStack/MinoxBeard/blob/master/MinoxBeard/MinoxBeard/Assets/Images/beard1.jpg?raw=true",
         "https://github.com/TallStack/MinoxBeard/blob/master/MinoxBeard/MinoxBeard/Assets/Images/beard1.jpg?raw=true",
         "https://github.com/TallStack/MinoxBeard/blob/master/MinoxBeard/MinoxBeard/Assets/Images/beard1.jpg?raw=true"]]
    
    let sections = ["First Photos", "Second Photos", "Third Photos"]
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    //MARK: Try to have table display data in two columns like the collection view
    private var viewModel: PokemonListViewModelProtocol

    init(viewModel: PokemonListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.viewModel.view = self
        //tableView.delegate = self
        //tableView.dataSource = self
        setupConstraints()

    }
//    init(){
//        super.init(frame: .zero)
//        tableView.delegate = self
//        tableView.dataSource = self
//        setupConstraints()
//    }
//    override init(frame: CGRect, style: UITableView.Style) {
//        super.init(frame: frame, style: style)
//        tableView.delegate = self
//        tableView.dataSource = self
//        setupConstraints()
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var tableView: UITableView = {
       let table = UITableView()
       table.translatesAutoresizingMaskIntoConstraints = false
       table.register(TableCell.self, forCellReuseIdentifier: "myCell")
       table.register(RandomTableCell.self, forCellReuseIdentifier: "RandomTableCell")
       table.register(BackTableCell.self, forCellReuseIdentifier: "BackTableCell")
       table.rowHeight = 250
       table.delegate = self
       table.dataSource = self
       table.layer.backgroundColor = UIColor.white.cgColor
       table.tableFooterView = UIView(frame: .zero)
       return table
    }()
    
    private lazy var indicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.hidesWhenStopped = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .default
        searchBar.placeholder = SearchString.SearchText.localizedSearch//"Find Pokemon"
        searchBar.searchTextField.font = UIFont(name: "Arial", size: 14)
        searchBar.sizeToFit()
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor.white.cgColor
        searchBar.delegate = self
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    func setupConstraints() {
        addSubview(searchBar)
        searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        //tableView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        addSubview(indicatorView)
        indicatorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        indicatorView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
     }

}
extension PokemonTableView: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let id = searchBar.text?.replacingOccurrences(of: " ", with: "") else {
            return
        }
        viewModel.fetchPokemon(by: id.lowercased())
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        searchBar.setShowsCancelButton(false, animated: false)
        viewModel.fetchPokemonList()
    }
}
extension PokemonTableView: UITableViewDelegate, UITableViewDataSource {
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
       if indexPath.row < 10 {
           let cell = tableView.dequeueReusableCell(withIdentifier: "RandomTableCell") as! RandomTableCell
           cell.configure(with: viewModel.cellViewModelFor(at: indexPath))
           return cell
       }else if indexPath.row < 20 {
           let cell = tableView.dequeueReusableCell(withIdentifier: "BackTableCell") as! BackTableCell
           cell.configure(with: viewModel.cellViewModelFor(at: indexPath))
           return cell
       }


      let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! TableCell
      //cell.pokemonImageView.load(url: URL(string: photos[indexPath.row])!)
      //cell.testImageView.load(url: URL(string: photos[indexPath.row])!)
      cell.configure(with: viewModel.cellViewModelFor(at: indexPath))
      return cell
//
       //MARK: Using hardcoded values for example
//       if indexPath.section == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! TableCell
//            cell.pokemonImageView.load(url: URL(string: photos[indexPath.section][indexPath.row])!)
//            return cell
//       }else if indexPath.section == 1 {
//           let cell = tableView.dequeueReusableCell(withIdentifier: "RandomTableCell") as! RandomTableCell
//           cell.cellImageView.load(url: URL(string: photos[indexPath.section][indexPath.row])!)
//           cell.cellLabel.text = "Beard for Section \(indexPath.section)"
//           return cell
//       }else {
//           let cell = tableView.dequeueReusableCell(withIdentifier: "BackTableCell") as! BackTableCell
//           cell.cellImageView.load(url: URL(string: photos[indexPath.section][indexPath.row])!)
//           cell.cellLabel.text = "Beard for Section \(indexPath.section)"
//           cell.secondCellLabel.text = "Whooo \(indexPath.section)"
//           return cell
//       }
}
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return viewModel.countPokemons

       //MARK: Using hardcoded values for example
       //return self.photos[section].count
   }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
        //MARK: Using hardcoded values for example
        //return self.sections.count
    }
    
    //OnClick Call for Specific indexPath
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.openDetailFor(indexPath: indexPath)
    }
    // Create a standard header that includes the returned text.
    func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
        return "Pokemons \(section)"
        
        //MARK: Using hardcoded values for example
        //return self.sections[section]
    }

    // Create a standard footer that includes the returned text.
    func tableView(_ tableView: UITableView, titleForFooterInSection
                                section: Int) -> String? {
       return "Gotta catch em all \(section)"
        
        //MARK: Using hardcoded values for example
       // return self.sections[section] + " end"
    }
}
extension PokemonTableView: PokemonListViewProtocol {

    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showLoading(_ show: Bool) {
        DispatchQueue.main.async {
            if show {
                self.indicatorView.startAnimating()
            } else {
                self.indicatorView.stopAnimating()
            }
        }
    }
}


extension UIImageView {
   func load(url: URL) {
      DispatchQueue.global().async { [weak self] in
         if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
              DispatchQueue.main.async {
                self?.image = image
              }
            }
         }
      }
   }
}



