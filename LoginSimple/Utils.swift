//
//  Utils.swift
//  LoginSimple
//
//  Created by Trương Duy Thái on 3/28/19.
//  Copyright © 2019 Trương Duy Thái. All rights reserved.
//

import Foundation
class Utils {
    static func checkValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    static func checkValidPassword(password: String) -> Bool {
        return !password.isEmpty && password.count > 5
    }
}
