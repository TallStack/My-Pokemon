//
//  Alert.swift
//  My Pokemon
//
//  Created by Keketso Ramosedi on 2022/10/28.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//

import UIKit

class Alert {

    static func make(title: String?, message: String? = nil, handler: (() -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: { action in
            guard let handler = handler else {return}
            handler()
        })
        alert.addAction(okAction)
        
        return alert
    }
}
