//
//  CoordinatorProtocol.swift
//  My Pokemon
//
//  Created by Keketso Ramosedi on 2022/10/28.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//

import UIKit

protocol CoordinatorProtocol {

    var navigationController: UINavigationController { get }
    
    func start()
    func coordinate(to coordinator: CoordinatorProtocol)
}

extension CoordinatorProtocol {

    func coordinate(to coordinator: CoordinatorProtocol) {
        DispatchQueue.main.async {
            coordinator.start()
        }
    }
}
