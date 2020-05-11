//
//  ViewController.swift
//  programatic views
//
//  Created by Will on 5/8/20.
//  Copyright © 2020 Will. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(facebookImage)
        view.addSubview(facebookText)
        setupControls()
        setupLayout()
        
    }
    
    private let facebookImage: UIImageView = {
        let imageName = "facebook_icon.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        return imageView
    }()
    
    private let facebookText: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Like us on Facebook", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\nLorem ipsum Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
        
    }()
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
        
    }()
    
    private let pageCounter: UIPageControl = {
        let control = UIPageControl()
        control.currentPage = 0
        control.numberOfPages = 4
        control.currentPageIndicatorTintColor = .systemBlue
        control.pageIndicatorTintColor = .gray
        return control
    }()
    
    // Sets image and text properties
    private func setupLayout() {
        
        //Facebook icon constraints
        facebookImage.translatesAutoresizingMaskIntoConstraints = false
        facebookImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        facebookImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        facebookImage.widthAnchor.constraint(equalToConstant: 250).isActive = true
        facebookImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        //Description contraints
        facebookText.topAnchor.constraint(equalTo: facebookImage.bottomAnchor, constant: 120).isActive = true
        facebookText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        facebookText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        facebookText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    // Sets control buttons and counter
    private func setupControls() {
        view.addSubview(nextButton)
        view.addSubview(previousButton)
        view.addSubview(pageCounter)
        
        //Next button constraints
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        // Next button constraints
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        previousButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        previousButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        previousButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        previousButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        // Counter contsraints
        pageCounter.translatesAutoresizingMaskIntoConstraints = false
        pageCounter.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        pageCounter.centerYAnchor.constraint(equalTo: nextButton.centerYAnchor, constant: 0).isActive = true
        pageCounter.leadingAnchor.constraint(equalTo: previousButton.trailingAnchor, constant: 5).isActive = true
        pageCounter.trailingAnchor.constraint(equalTo: nextButton.leadingAnchor, constant: 5).isActive = true
    }
}

