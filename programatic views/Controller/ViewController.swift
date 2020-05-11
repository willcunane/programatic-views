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
        setupLayout()
        
    }
    
    let facebookImage: UIImageView = {
        let imageName = "facebook_icon.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        return imageView
    }()
    
    let facebookText: UITextView = {
        let textView = UITextView()
        textView.text = "Like us on Facebook!"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    

    
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
}

