//
//  Themes.swift
//  Themeable
//
//  Created by Fadi Abuzant on 12/08/2021.
//

import UIKit

class ThemesManager {
    
    static let shared = ThemesManager()
    
    func switchToTheme(theme: Themes, storyboard: UIStoryboard?) {
        UIColor.switchToTheme(theme.rawValue)
        if let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
            keyWindow.rootViewController = storyboard?.instantiateInitialViewController()
            keyWindow.makeKeyAndVisible()
        }
        UserDefaults.standard.setValue(theme.rawValue, forKey: "Theme")
    }
    
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
}


