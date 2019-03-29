//
//  UILabel.swift
//  LoginSimple
//
//  Created by Trương Duy Thái on 3/29/19.
//  Copyright © 2019 Trương Duy Thái. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    @IBInspectable
    var letterSpace: CGFloat {
        set {
            let attributedString = NSMutableAttributedString(string: (self.titleLabel?.text!)!)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: newValue, range: NSRange(location: 0, length: (self.titleLabel?.text!.count)!))
            self.setAttributedTitle(attributedString, for: .normal)
        }
        get {
            if let currentLetterSpace = currentAttributedTitle?.attribute(NSAttributedString.Key.kern, at: 0, effectiveRange: .none) as? CGFloat {
                return currentLetterSpace
            }
            else {
                return 0
            }
        }
    }
}
