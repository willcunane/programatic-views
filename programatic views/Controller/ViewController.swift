//
//  ViewController.swift
//  programatic views
//
//  Created by Will on 5/8/20.
//  Copyright © 2020 Will. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tapCount : Int = 0
       
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(displayImage)
        view.addSubview(displayText)
        setupControls()
        setupLayout()
        
    }
    
    // Initalized the display image to facebook icon and is updated when next or previous is tapped
    private let displayImage: UIImageView = {
        let imageName = "facebook_icon.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        return imageView
    }()
    
    private let displayText: UITextView = {
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
    
    @objc func nextButtonTapped() {
        tapCount += 1
        pageCounter.currentPage += 1
        updatePageContent()
    }
    
    @objc func backButtonTapped() {
        tapCount -= 1
        pageCounter.currentPage -= 1
        updatePageContent()
    }
    
    // Changes image and text based off the var tapCount
    func updatePageContent() {
        if tapCount == -1 {
            tapCount = 0
        } else if tapCount == 0 {
            displayImage.image = facebookImage.image
        } else if tapCount == 1 {
            displayImage.image = twitterImage.image
            displayText.attributedText = twitterText.attributedText
        } else if tapCount == 2 {
            displayImage.image = instagramImage.image
            displayText.attributedText = instagramText.attributedText
        } else if tapCount == 3 {
            displayImage.image = linkedinImage.image
            displayText.attributedText = linkedinText.attributedText
            nextButton.setTitle("NEXT", for: .normal)
        } else if tapCount == 4 {
            displayImage.image = youtubeImage.image
            displayText.attributedText = youtubeText.attributedText
            nextButton.setTitle("DONE", for: .normal)
        } else if tapCount == 5 {
            tapCount = 4
            loadHomeView()
            print("Load next view")
        }
    }
    
    // Loads next view controller
    fileprivate func loadHomeView() {
        let vc = HomeViewController()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let pageCounter: UIPageControl = {
        let control = UIPageControl()
        control.currentPage = 0
        control.numberOfPages = 5
        control.currentPageIndicatorTintColor = .systemBlue
        control.pageIndicatorTintColor = .gray
        return control
    }()
    
    // There has to be a better way to do this
    private let facebookImage: UIImageView = {
        let imageName = "facebook_icon.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let twitterImage: UIImageView = {
        let imageName = "twitter_icon.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let instagramImage: UIImageView = {
        let imageName = "instagram_icon.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let linkedinImage: UIImageView = {
        let imageName = "linkedin_icon.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let youtubeImage: UIImageView = {
        let imageName = "youtube_icon.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
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
    
    private let twitterText: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Follow us on Twitter", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\nLorem ipsum Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let instagramText: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Follow us on Instagram", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\nLorem ipsum Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let linkedinText: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Follow us on LinkedIn", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\nLorem ipsum Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let youtubeText: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Subscribe to us on YouTube", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\nLorem ipsum Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    // Sets image and text properties
    private func setupLayout() {
        
        //Facebook icon constraints
        displayImage.translatesAutoresizingMaskIntoConstraints = false
        displayImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        displayImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        displayImage.widthAnchor.constraint(equalToConstant: 250).isActive = true
        displayImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        //Description contraints
        displayText.topAnchor.constraint(equalTo: displayImage.bottomAnchor, constant: 120).isActive = true
        displayText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        displayText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        displayText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
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

