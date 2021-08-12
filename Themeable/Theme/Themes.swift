//
//  Themes.swift
//  Themeable
//
//  Created by Fadi Abuzant on 12/08/2021.
//

import Foundation

enum Themes : String {
    case theme1 = ""
    case theme2 = "Theme2"
    case theme3 = "Theme3"
    
    init?(rawValue: Int) {
        switch rawValue {
        case 1:
            self = .theme2
        case 2:
            self = .theme3
        default:
            self = .theme1
        }
    }
}
