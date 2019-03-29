//
//  UILabel.swift
//  LoginSimple
//
//  Created by Trương Duy Thái on 3/29/19.
//  Copyright © 2019 Trương Duy Thái. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    @IBInspectable
    var letterSpace: CGFloat {
        set {
            self.defaultTextAttributes.updateValue(newValue, forKey: NSAttributedString.Key.kern)
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
