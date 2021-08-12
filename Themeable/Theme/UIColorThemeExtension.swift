//
//  UIColorThemeExtension.swift
//  Themeable
//
//  Created by Fadi Abuzant on 11/08/2021.
//

import UIKit

extension UIColor {
    
    /// Cache all  colors in assets before swizzle
    fileprivate static var listOfColors = [String:UIColor]()
    /// Theme names
    fileprivate static var themes = [String]()
    /// Current selected theme
    fileprivate static var selectedTheme = ""
    /// Class list for swizzle
    fileprivate static let classesToSwizzle: [String] = [
      "UIColor",
      "UIDeviceRGBColor",
      "NSColor",
      "UIDisplayP3Color",
      "UIPlaceholderColor",
      "UICIColor",
      "UIDeviceWhiteColor",
      "UICGColor",
      "UICachedDeviceRGBColor",
      "UICachedDeviceWhiteColor",
      "UICachedDevicePatternColor",
    ]
    /// You can switch theme by name.
    ///
    /// Use this method to switch between themes.
    /// - Warning: Make sure that you use theme name in the color assets like this `color_Theme1`.
    /// - Parameter theme: `Theme` you want to switch
    static func switchToTheme(_ theme:String){
        selectedTheme = theme
    }
    /// Get the current theme
    static var currentTheme : String {
        return selectedTheme
    }
    /// Swizzle colors for theme
    ///
    /// This method will do the magic and will take about theme switching.
    /// - Warning: Make sure that you call this method at the begin of your app.
    /// - Parameter appThemes: `Theme names` that you want to use in your app
    static func swizzleInitImplementation(appThemes:[String]? = nil) {
        for color in colorsNames {
            listOfColors[color] = UIColor.init(named: color)
        }
        
        if let appThemes = appThemes {
            themes.append(contentsOf: appThemes)
        }
        
        for className in classesToSwizzle {
            if let classFromString = NSClassFromString(className){
                swizzle(originalClass: classFromString.self,
                        originalSelector: #selector(UIColor.init(named:in:compatibleWith:)),
                        isOriginalSelectorClassMethod: true,
                        swizzledClass: classFromString.self,
                        swizzledSelector: #selector(UIColor.initOver(named:in:compatibleWith:)),
                        isSwizzledSelectorClassMethod: true)
                
            }
        }
    }
    
    @objc fileprivate class func initOver(named name: String, in bundle: Bundle?, compatibleWith traitCollection: UITraitCollection?) -> UIColor? {
        let theme = selectedTheme.isEmpty ? "" : "_\(selectedTheme)"
        if let color = UIColor.listOfColors[name+theme] {
            return color
        }else if let color = UIColor.listOfColors[name] {
            return color
        }
        fatalError("\(name) is not set. please run swiftgen")
    }
    
    fileprivate static func swizzle(originalClass: AnyClass,
                 originalSelector: Selector,
                 isOriginalSelectorClassMethod: Bool,
                 swizzledClass: AnyClass,
                 swizzledSelector: Selector,
                 isSwizzledSelectorClassMethod: Bool) {
        guard let originalMethod = isOriginalSelectorClassMethod ?
            class_getClassMethod(originalClass, originalSelector) :
            class_getInstanceMethod(originalClass, originalSelector) else {
                return
        }

        guard let swizzledMethod = isSwizzledSelectorClassMethod ?
            class_getClassMethod(swizzledClass, swizzledSelector) :
            class_getInstanceMethod(swizzledClass, swizzledSelector) else {
                return
        }

        let didAddMethod = class_addMethod(isOriginalSelectorClassMethod ? object_getClass(originalClass)! : originalClass,
                                           originalSelector,
                                           method_getImplementation(swizzledMethod),
                                           method_getTypeEncoding(swizzledMethod))

        if didAddMethod {
            class_replaceMethod(isSwizzledSelectorClassMethod ? object_getClass(swizzledClass)! : swizzledClass,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
}


