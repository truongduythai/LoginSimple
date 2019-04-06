//
//  ViewController.swift
//  AutolayoutSimple
//
//  Created by Trương Duy Thái on 4/6/19.
//  Copyright © 2019 Trương Duy Thái. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var topView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var middleView:UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var bottomView:UIStackView = {
        let view: UIStackView = UIStackView(arrangedSubviews: [])
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var imageView: UIImageView = {
        let image: UIImageView = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var prevButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("prev", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        return button
    }()
    
    var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("next", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        return button
    }()
    
    var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.numberOfPages = 5
        control.currentPageIndicatorTintColor = UIColor(ciColor: .red)
        control.pageIndicatorTintColor = UIColor(ciColor: .black)
        return control
    }()
    
    var textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let strTitle: String = "Join us today in our awesome flower!"
    let strDesc: String = "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(topView)
        view.addSubview(middleView)
        view.addSubview(bottomView)
        setupTopViewConstrainLayou()
        setupMiddleViewConstrainLayou()
        setupBottomViewConstrainLayou()
    }
    
    func setupTopViewConstrainLayou() {
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        topView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
        topView.addSubview(imageView)
        setupImageViewConstrainLayout()
    }
    
    func setupMiddleViewConstrainLayou() {
        middleView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0).isActive = true
        middleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        middleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        middleView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.6).isActive = true
        middleView.addSubview(textView)
        textView.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 20).isActive = true
        textView.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -20).isActive = true
        textView.topAnchor.constraint(equalTo: middleView.topAnchor, constant: 20).isActive = true
        setupAttributedString()
    }
    
    func setupBottomViewConstrainLayou() {
        bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        bottomView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
        
        bottomView.addArrangedSubview(prevButton)
        bottomView.addArrangedSubview(pageControl)
        bottomView.addArrangedSubview(nextButton)
        bottomView.distribution = .fillEqually
    }
    
    func setupImageViewConstrainLayout() {
        imageView.image = UIImage(named: "third")
        imageView.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.8).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1).isActive = true
    }
    
    func setupAttributedString() {
        let textAttribute = NSMutableAttributedString(string: self.strTitle, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        textAttribute.append(NSAttributedString(string: "\n\n\n"))
        
        textAttribute.append(NSAttributedString(string: self.strDesc, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = textAttribute
        
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .center
    }
    
    
    
}

