//
//  RandomTableCell.swift
//  My Pokemon
//
//  Created by Keketso Ramosedi on 2022/11/11.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//

import UIKit

class RandomTableCell: UITableViewCell {

    var cellImageView = UIImageView()
       var cellLabel = UILabel()

       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: "RandomTableCell")
           
           cellImageView.translatesAutoresizingMaskIntoConstraints = false
           cellImageView.contentMode = .scaleAspectFit
           contentView.addSubview(cellImageView)
           
           cellLabel.translatesAutoresizingMaskIntoConstraints = false
           cellLabel.font = UIFont.systemFont(ofSize: 20)
           contentView.addSubview(cellLabel)
           
           NSLayoutConstraint.activate([
               cellImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
               cellImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
               cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
               cellImageView.widthAnchor.constraint(equalToConstant: 44),
               
               cellLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
               cellLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 10),
               
           ])
       }
       
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with viewModel: PokemonCellViewModel) {
        self.cellLabel.text = viewModel.name
        setImage(id: viewModel.id)
    }
    
    private func setImage(id: String) {
        guard let url = URL(string: "\(Constants.imageUrl)\(id).png") else {
            return
        }

        ImageCache.getImage(with: url) { [weak self] (image) in
            guard let self = self,
                  let image = image else { return }
            self.cellImageView.image = image
            //self.backgroundColor = image.averageColor
        }
    }

}
