//
//  LanderViewController.swift
//  LoginSimple
//
//  Created by Trương Duy Thái on 3/27/19.
//  Copyright © 2019 Trương Duy Thái. All rights reserved.
//

import UIKit

class LanderViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    
    var countTimer:Timer!
    let couterTotal: Float = 5
    var counterCurrent: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: {timer in
            self.counterCurrent += 1 / (self.couterTotal * 100)
            self.progressView.setProgress(self.counterCurrent, animated: true)
            if self.counterCurrent >= 1 {
                self.navigationController?.pushViewController(SignInViewController(), animated: true)
                timer.invalidate()
            }
        })
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
