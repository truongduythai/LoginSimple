//
//  UILabel.swift
//  LoginSimple
//
//  Created by Trương Duy Thái on 3/29/19.
//  Copyright © 2019 Trương Duy Thái. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    @IBInspectable
    var letterSpace: CGFloat {
        set {
            let attributedString = NSMutableAttributedString(string: self.text!)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: newValue, range: NSRange(location: 0, length: self.text!.count))
            self.attributedText = attributedString
        }
        
        get {
            if let currentLetterSpace = attributedText?.attribute(NSAttributedString.Key.kern, at: 0, effectiveRange: .none) as? CGFloat {
                return currentLetterSpace
            }
            else {
                return 0
            }
        }
    }
}
