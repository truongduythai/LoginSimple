//
//  PassDataDelegate.swift
//  DelegateSimple
//
//  Created by Trương Duy Thái on 4/6/19.
//  Copyright © 2019 Trương Duy Thái. All rights reserved.
//

import Foundation
import UIKit

protocol PassData {
    func passDataWithoutReturnValue(data: String)
    func passDataWithReturnValue(data: String) -> String
}
