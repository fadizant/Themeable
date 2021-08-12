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
    }

    @IBAction func switchTheme(_ sender: UIButton) {
        guard let theme = Themes.init(rawValue: sender.tag) else {
            return
        }
        UIColor.switchToTheme(theme.rawValue)
        if let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
            keyWindow.rootViewController = storyboard?.instantiateInitialViewController()
            keyWindow.makeKeyAndVisible()
        }
    }
    
}
