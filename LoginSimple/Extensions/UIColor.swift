//
//  UIColor.swift
//  SecondScreenSimple
//
//  Created by Trương Duy Thái on 3/27/19.
//  Copyright © 2019 Trương Duy Thái. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: Float) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha))
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            alpha: 1.0
        )
    }
    
    convenience init(rgb: Int, alpha: Float) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            alpha: alpha
        )
    }
}
