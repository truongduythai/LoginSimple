//
//  ViewController.swift
//  DelegateSimple
//
//  Created by Trương Duy Thái on 4/6/19.
//  Copyright © 2019 Trương Duy Thái. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var passData: PassData?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backRootView(_ sender: Any) {
        if let passData = self.passData {
            let returnValue = passData.passDataWithReturnValue(data: "Data 1")
            print("return value: \(returnValue)")
            passData.passDataWithoutReturnValue(data: "Data 2")
        }
        self.navigationController?.popViewController(animated: true)
    }
}

