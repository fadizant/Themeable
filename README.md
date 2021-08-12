
# Themeable

Easy way to switch between themes using swizzle to catch app colors and return the selected theme color.

  
## Setup

- copy [UIColorThemeExtension.swift](https://github.com/fadizant/Themeable/blob/main/Themeable/Theme/UIColorThemeExtension.swift), [asset-to-color-extension.stencil](https://github.com/fadizant/Themeable/blob/main/asset-to-color-extension.stencil) and [swiftgen.yml](https://github.com/fadizant/Themeable/blob/main/swiftgen.yml) to your project

- make sure that [asset-to-color-extension.stencil](https://github.com/fadizant/Themeable/blob/main/asset-to-color-extension.stencil) and [swiftgen.yml](https://github.com/fadizant/Themeable/blob/main/swiftgen.yml) in the same folder

- change folder directory for output and inputs in [swiftgen.yml](https://github.com/fadizant/Themeable/blob/main/swiftgen.yml)

- install [SwiftGen](https://github.com/SwiftGen/SwiftGen#installation)

- run [SwiftGen](https://github.com/SwiftGen/SwiftGen#installation) in your project

- [SwiftGen](https://github.com/SwiftGen/SwiftGen) will generat [UIColorExtension.swift](https://github.com/fadizant/Themeable/blob/main/Themeable/Theme/UIColorExtension.swift "UIColorExtension.swift") in output directory for you. this file must have  `colorsNames` to get all colors in your [Colors.xcassets](https://github.com/fadizant/Themeable/tree/main/Themeable/Colors.xcassets "Colors.xcassets") assets file.

## How to use
- call `UIColor.swizzleInitImplementation` with themes of your app in the begining.

- to add colors for your theme, you have to use this formate `colorName_themeName` 
colorName is the name of color 
themeName is theme name 

- call `UIColor.switchToTheme` with theme name when you want to switch theme. if you want to return to default theme set theme name as empty `UIColor.switchToTheme("")`

- to see the effect of theme switch you have to reset your window
