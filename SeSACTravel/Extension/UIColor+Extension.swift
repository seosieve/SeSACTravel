//
//  UIColor+Extension.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/28/24.
//

import UIKit

extension UIColor {
    static var randomColor: UIColor {
        let rgb = (0...2).map{ _ in CGFloat.random(in: 0.5...1)}
        let (red, green, blue) = (rgb[0], rgb[1], rgb[2])
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        return color
    }
}
