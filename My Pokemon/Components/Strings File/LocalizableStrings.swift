//
//  LocalizableStrings.swift
//  My Pokemon
//
//  Created by Keketso Ramosedi on 2022/11/03.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//

import Foundation

enum SearchString: String
{
    case SearchText
        
    var localizedSearch : String
    {
        NSLocalizedString(String(describing: Self.self) + "_\(rawValue)", comment: "")
    }
    
}


enum TitleString: String
{
    case TitleText
        
    var localizedText : String
    {
        NSLocalizedString(String(describing: Self.self) + "_\(rawValue)", comment: "")
    }
    
}
