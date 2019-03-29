//
//  SignInViewController.swift
//  LoginSimple
//
//  Created by Trương Duy Thái on 3/27/19.
//  Copyright © 2019 Trương Duy Thái. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btEye: UIButton!
    @IBAction func onFogotPasswordClicked(_ sender: Any) {
        self.onShowAlert("Forgot password clicked")
    }
    
    @IBAction func onLoginClicked(_ sender: Any) {
        if self.onValidateTextField() {
            self.onShowAlert("Login success")
        } else {
            self.onShowAlert("Login fail")
        }
    }
    @IBAction func onSignUpClicked(_ sender: Any) {
        self.onShowAlert("Sign up clicked")
    }
    @IBAction func onEyeButtonClicked(_ sender: Any) {
        isSecureTextEntry = !isSecureTextEntry
        btEye.setImage(UIImage(named: isSecureTextEntry ? "ic_eye_visible" : "ic_eye_invisible"), for: .normal)
        updateMaskStr()
    }
    
    var realText:String = ""
    var maskChar:Character = "*"
    var isSecureTextEntry: Bool = true
    
    var alert = UIAlertController(title: "Message", message: "", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tfPassword.delegate = self
        tfPassword.addTarget(self, action: #selector(self.textFiledEditingChanged(textField:)), for: .editingChanged)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let curText = self.realText
        let updatedStr:String = (curText as NSString).replacingCharacters(in: range, with: string)
        
        self.realText = updatedStr
        return true
    }
    
    @objc func textFiledEditingChanged(textField: UITextField) {
        updateMaskStr()
    }
    
    func updateMaskStr(){
        //change real text to mask char
        var maskStr = ""
        if isSecureTextEntry {
            for _ in self.realText {
                maskStr += String(self.maskChar)
            }
        } else {
            maskStr = self.realText
        }
        tfPassword.text = maskStr
    };
    
    func onValidateTextField() -> Bool {
        if !Utils.checkValidEmail(email: tfEmail.text ?? "") {
            return false
        }
        if !Utils.checkValidPassword(password: tfPassword.text ?? "") {
            return false
        }
        return true
    }
    
    func onShowAlert(_ message: String) {
        alert.message = message
        self.present(alert, animated: true, completion: nil)
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
