//
//  Constans.swift
//  CocktailRecipes
//
//  Created by Maxim Tvilinev on 28.11.2023.
//

import UIKit

// MARK: -  AdKeys

//let bannerKey = "ca-app-pub-9253109572418258/5495299445"
let bannerKey = "ca-app-pub-3940256099942544/2934735716"

// MARK: -

extension UIColor {
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

enum Colors {
    static var rectColor = UIColor.rgb(r: 247, g: 248, b: 249)
    static var roseColor = UIColor.rgb(r: 255, g: 46, b: 130)
    static var grayColor = UIColor.rgb(r: 241, g: 245, b: 251)
}
