//
//  ViewController.swift
//  DelegateSimple
//
//  Created by Trương Duy Thái on 4/6/19.
//  Copyright © 2019 Trương Duy Thái. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PassData {
    func passDataWithoutReturnValue(data: String) {
        print(data)
    }
    
    func passDataWithReturnValue(data: String) -> String {
        return "Recived data"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pushController" {
            let controller = segue.destination as! SecondViewController
            controller.passData = self
        }
    }
    
}

