//
//  ShowAlert.swift
//  My Pokemon
//
//  Created by Keketso Ramosedi on 2022/10/28.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//

import UIKit

protocol ShowAlert {
    
    func showAlert(_ alert: UIAlertController)
}

extension ShowAlert where Self: CoordinatorProtocol {
    
    func showAlert(_ alert: UIAlertController) {
        DispatchQueue.main.async {
            self.navigationController.present(alert, animated: true, completion: nil)
        }
    }
}
