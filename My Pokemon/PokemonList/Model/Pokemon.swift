//
//  Pokemon.swift
//  My Pokemon
//
//  Created by Keketso Ramosedi on 2022/10/28.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//

import Foundation
struct Pokemon: Decodable {

    let name: String
    var id: String?
    
    init(name: String = "", id: Int = 0) {
        self.name = name
        self.id = String(describing: id)
    }
}
