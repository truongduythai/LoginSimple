//
//  SignInByCodeViewController.swift
//  LoginSimple
//
//  Created by Trương Duy Thái on 4/11/19.
//  Copyright © 2019 Trương Duy Thái. All rights reserved.
//

import UIKit

class SignInByCodeViewController: UIViewController {
    
    var parentStack: UIStackView = {
        var view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .equalSpacing
        return view
    }()
    
    var emptyTopView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var topStackView: UIStackView = {
        var view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 5
        view.alignment = .leading
        return view
    }()
    
    var middleStackView: UIStackView = {
        var view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 20
        return view
    }()
    
    var bottomStackView: UIStackView = {
        var view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        return view
    }()
    
    var emptyBottomView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var logo: UIImageView = {
       var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "ic_logo")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    var lbWelcome: UILabel = {
       var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Welcome Back,"
        view.textColor = UIColor(rgb: 0x3F3F3F)
        view.font = UIFont(name: "AvenirNext-DemiBold", size: 26)
        return view
    }()
    
    var lbSignIn: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Sign in to continue"
        view.textColor = UIColor(rgb: 0xA8A8A8)
        view.font = UIFont(name: "AvenirNext-Medium", size: 16)
        return view
    }()
    
    var emailStackView: UIStackView = {
        var view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
    var lbEmail: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Email"
        view.font = UIFont(name: "AvenirNext-Medium", size: 14)
        return view
    }()
    
    var tfEmail: UITextField = {
        var view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(rgb: 0x9D9D9D)
        view.font = UIFont(name: "AvenirNext-Medium", size: 14)
        return view
    }()
    
    var lineEmailView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(rgb: 0xD3D3D3)
        return view
    }()
    
    var passwordStackView: UIStackView = {
        var view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
    var lbPassword: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Password"
        view.font = UIFont(name: "AvenirNext-Medium", size: 14)
        return view
    }()
    
    var inputPasswordStackView: UIStackView = {
        var view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        return view
    }()
    
    var tfPassword: UITextField = {
        var view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(rgb: 0x9D9D9D)
        view.font = UIFont(name: "AvenirNext-Medium", size: 14)
        return view
    }()
    
    var eyeButton: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "ic_eye_visible"), for: .normal)
        return view
    }()
    
    var linePasswordView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(rgb: 0xD3D3D3)
        return view
    }()
    
    var forgotButton: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Forgot Password?", for: .normal)
        view.setTitleColor(UIColor(rgb: 0x939393), for: .normal)
        view.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 15)
        return view
    }()
    
    var loginButton: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Login", for: .normal)
        view.backgroundColor = UIColor(rgb: 0x674CCA)
        view.titleLabel?.textColor = UIColor(rgb: 0xffffff)
        view.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        view.addTarget(self, action: #selector(loginPressed(sender:)), for: .touchUpInside)
        return view
    }()
    
    var signUpStackView: UIStackView = {
       var view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fill
        view.spacing = 10
        return view
    }()
    
    var lbNewUser: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "New User?"
        view.font = UIFont(name: "AvenirNext-Medium", size: 15)
        view.textColor = UIColor(rgb: 0x939393)
        return view
    }()
    
    var SignUpButton: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Signup", for: .normal)
        view.setTitleColor(UIColor(rgb: 0x674CCA), for: .normal) 
        view.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 17)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addSubView()
        setupSubView()
        
        
    }
    
    
    func addSubView() {
        view.addSubview(parentStack)
    }
    
    func setupSubView() {
        setupParrentStack()
        setupTopStack()
        setupMiddleStack()
        setupEmailStackView()
        setupPasswordStackView()
        setupBottomStack()
    }
    
    
    
    func setupParrentStack() {
        parentStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        parentStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        parentStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        parentStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        parentStack.addArrangedSubview(emptyTopView)
        parentStack.addArrangedSubview(topStackView)
        parentStack.addArrangedSubview(middleStackView)
        parentStack.addArrangedSubview(bottomStackView)
        parentStack.addArrangedSubview(emptyBottomView)
        
        
    }
    
    func setupTopStack() {
        topStackView.addArrangedSubview(logo)
        topStackView.addArrangedSubview(lbWelcome)
        topStackView.addArrangedSubview(lbSignIn)
        
        logo.widthAnchor.constraint(equalToConstant: 45).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 85).isActive = true
    }
    
    func setupMiddleStack() {
        middleStackView.addArrangedSubview(emailStackView)
        middleStackView.addArrangedSubview(passwordStackView)
        middleStackView.addArrangedSubview(forgotButton)
    }
    
    func setupEmailStackView() {
        emailStackView.addArrangedSubview(lbEmail)
        emailStackView.addArrangedSubview(tfEmail)
        emailStackView.addArrangedSubview(lineEmailView)
        lineEmailView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupPasswordStackView() {
        passwordStackView.addArrangedSubview(lbPassword)
        passwordStackView.addArrangedSubview(inputPasswordStackView)
        inputPasswordStackView.addArrangedSubview(tfPassword)
        inputPasswordStackView.addArrangedSubview(eyeButton)
        passwordStackView.addArrangedSubview(linePasswordView)
        linePasswordView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        eyeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        eyeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupBottomStack() {
        bottomStackView.addArrangedSubview(loginButton)
        bottomStackView.addArrangedSubview(signUpStackView)
        signUpStackView.addArrangedSubview(lbNewUser)
        signUpStackView.addArrangedSubview(SignUpButton)
        loginButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    @objc func loginPressed(sender: UIButton!) {
        self.navigationController?.pushViewController(SimpleTableViewController(), animated: true)
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
