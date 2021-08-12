//
//  ViewController.swift
//  Themeable
//
//  Created by Fadi Abuzant on 11/08/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchThemeButton1: UIButton!
    @IBOutlet weak var switchThemeButton2: UIButton!
    @IBOutlet weak var switchThemeButton3: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switchThemeButton1.setTitleColor(UIColor.init(named: "Buttons"), for: .normal)
        switchThemeButton2.setTitleColor(UIColor.init(named: "Buttons"), for: .normal)
        switchThemeButton3.setTitleColor(UIColor.init(named: "Buttons"), for: .normal)
        
        switchThemeButton1.isSelected = UIColor.currentTheme == ThemesManager.Themes.theme1.rawValue
        switchThemeButton2.isSelected = UIColor.currentTheme == ThemesManager.Themes.theme2.rawValue
        switchThemeButton3.isSelected = UIColor.currentTheme == ThemesManager.Themes.theme3.rawValue
    }

    @IBAction func switchTheme(_ sender: UIButton) {
        guard let theme = ThemesManager.Themes.init(rawValue: sender.tag) else {
            return
        }
        ThemesManager.shared.switchToTheme(theme: theme, storyboard: storyboard)
    }
    
}
