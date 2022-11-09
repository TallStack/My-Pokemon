//
//  TableCell.swift
//  My Pokemon
//
//  Created by Keketso Ramosedi on 2022/11/08.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: "myCell")
       setupConstraints()
    }
    
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    let cardView: UIView = {
       let view = UIView()
       view.layer.cornerRadius = 14
       view.backgroundColor = .white
       view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    let pokemonImageView: UIImageView = {
       let imageView = UIImageView()
       imageView.layer.cornerRadius = 14
       imageView.clipsToBounds = true
       imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
    }()
    
    let testImageView: UIImageView = {
       let imageView = UIImageView()
       imageView.layer.cornerRadius = 25
       imageView.clipsToBounds = true
       imageView.contentMode = .scaleAspectFill
       imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
    }()
    
    let pokemonIdLabel: UILabel = {
       let label = UILabel()
       label.text = "Id"
       label.textAlignment = .center
       label.font = UIFont.systemFont(ofSize: 14)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    let pokemonNameLabel: UILabel = {
       let label = UILabel()
       label.text = "pokemon"
       label.textAlignment = .center
       label.font = UIFont.systemFont(ofSize: 14)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    func configure(with viewModel: PokemonCellViewModel) {
        self.pokemonNameLabel.text = viewModel.name
        self.pokemonIdLabel.text = "#\(viewModel.id)"
        setImage(id: viewModel.id)
    }
    
    private func setImage(id: String) {
        guard let url = URL(string: "\(Constants.imageUrl)\(id).png") else {
            return
        }

        ImageCache.getImage(with: url) { [weak self] (image) in
            guard let self = self,
                  let image = image else { return }
            self.pokemonImageView.image = image
            //self.backgroundColor = image.averageColor
        }
    }
    
    
    
    func setupConstraints() {
        //1st LAYER - UIView
        addSubview(cardView)
        cardView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 12).isActive = true
        cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        cardView.backgroundColor = .systemBackground
        //2nd LAYER - UIImageView
        cardView.addSubview(pokemonImageView)
        pokemonImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 12).isActive = true
        pokemonImageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -12).isActive = true
        pokemonImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 12).isActive = true
        pokemonImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -12).isActive = true
        //3rd LAYER - UIImageView
//        cardView.addSubview(testImageView)
//        testImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        testImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
//        testImageView.topAnchor.constraint(equalTo: pokemonImageView.topAnchor, constant: 12).isActive = true
//        testImageView.leadingAnchor.constraint(equalTo: pokemonImageView.leadingAnchor, constant: 12).isActive = true
        //4th LAYER - UILabel
        cardView.addSubview(pokemonIdLabel)
        pokemonIdLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pokemonIdLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        pokemonIdLabel.topAnchor.constraint(equalTo: pokemonImageView.topAnchor, constant: 12).isActive = true
        pokemonIdLabel.leadingAnchor.constraint(equalTo: pokemonImageView.leadingAnchor, constant: 12).isActive = true
//        pokemonIdLabel.centerYAnchor.constraint(equalTo: testImageView.centerYAnchor).isActive = true
//        pokemonIdLabel.leadingAnchor.constraint(equalTo: testImageView.trailingAnchor, constant: 8).isActive = true
        //5th LAYER - UILabel
        cardView.addSubview(pokemonNameLabel)
        pokemonNameLabel.centerYAnchor.constraint(equalTo: pokemonIdLabel.centerYAnchor).isActive = true
        pokemonNameLabel.leadingAnchor.constraint(equalTo: pokemonIdLabel.trailingAnchor, constant: 8).isActive = true
        //Let's remove selection style from the cell as well
        selectionStyle = .none
     }

}
