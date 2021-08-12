
import UIKit

public extension UIColor {

  static let buttons = UIColor.color(named: "Buttons")
  static let main = UIColor.color(named: "Main")
  static let topBar = UIColor.color(named: "TopBar")
  static let buttonsTheme2 = UIColor.color(named: "Buttons_Theme2")
  static let mainTheme2 = UIColor.color(named: "Main_Theme2")
  static let topBarTheme2 = UIColor.color(named: "TopBar_Theme2")
  static let buttonsTheme3 = UIColor.color(named: "Buttons_Theme3")
  static let mainTheme3 = UIColor.color(named: "Main_Theme3")
  static let topBarTheme3 = UIColor.color(named: "TopBar_Theme3")

  static let allColors: [UIColor] = [
    buttons,
    main,
    topBar,
    buttonsTheme2,
    mainTheme2,
    topBarTheme2,
    buttonsTheme3,
    mainTheme3,
    topBarTheme3,
  ]

  static let colorsNames: [String] = [
    "Buttons",
    "Main",
    "TopBar",
    "Buttons_Theme2",
    "Main_Theme2",
    "TopBar_Theme2",
    "Buttons_Theme3",
    "Main_Theme3",
    "TopBar_Theme3",
  ]

  private static func color(named: String) -> UIColor {
      return UIColor.init(named: named)!
  }

}

