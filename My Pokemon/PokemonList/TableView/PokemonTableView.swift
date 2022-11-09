//
//  PokemonTableView.swift
//  My Pokemon
//
//  Created by Keketso Ramosedi on 2022/11/08.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//

import UIKit

class PokemonTableView: UIView {

    let photos = ["https://github.com/TallStack/MinoxBeard/blob/master/MinoxBeard/MinoxBeard/Assets/Images/beard3.jpg?raw=true", "https://github.com/TallStack/MinoxBeard/blob/master/MinoxBeard/MinoxBeard/Assets/Images/beard3.jpg?raw=true", "https://github.com/TallStack/MinoxBeard/blob/master/MinoxBeard/MinoxBeard/Assets/Images/beard3.jpg?raw=true"]
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    //MARK: Try to have table display data in two columns like the collection view
//    private var viewModel: PokemonListViewModelProtocol
//
//    init(viewModel: PokemonListViewModelProtocol) {
//        self.viewModel = viewModel
//        super.init(frame: .zero)
//        self.viewModel.view = self
//        tableView.delegate = self
//        tableView.dataSource = self
//        setupConstraints()
//
//    }
    init(){
        super.init(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        setupConstraints()
    }
//    override init(frame: CGRect, style: UITableView.Style) {
//        super.init(frame: frame, style: style)
//        tableView.delegate = self
//        tableView.dataSource = self
//        setupConstraints()
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let tableView: UITableView = {
       let table = UITableView()
       table.translatesAutoresizingMaskIntoConstraints = false
       table.register(TableCell.self, forCellReuseIdentifier: "myCell")
       table.rowHeight = 250
       table.layer.backgroundColor = UIColor.white.cgColor
       table.tableFooterView = UIView(frame: .zero)
       return table
    }()
    
    
    func setupConstraints() {
        addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
     }

}
//extension PokemonTableView: PokemonListViewProtocol {
//
//    func reloadCollectionView() {
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//    }
//    
//    func showLoading(_ show: Bool) {
//        DispatchQueue.main.async {
//            if show {
//                
//            } else {
//                
//            }
//        }
//    }
//}

extension PokemonTableView: UITableViewDelegate, UITableViewDataSource {
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! TableCell
      cell.pokemonImageView.load(url: URL(string: photos[indexPath.row])!)
      //cell.testImageView.load(url: URL(string: photos[indexPath.row])!)
      //cell.configure(with: viewModel.cellViewModelFor(at: indexPath))
      return cell
}
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       //return viewModel.countPokemons
      return photos.count
   }
    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("selected cell \(indexPath.row)")
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



