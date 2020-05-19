//
//  ViewController.swift
//  programatic views
//
//  Created by Will on 5/8/20.
//  Copyright © 2020 Will. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate var tapCount : Int = 0
       
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLayout()
        setupControls()
        initSwipe()
    }
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        checkPreviousLoad()
//    }

    // Inits the display image
    private let displayImage: UIImageView = {
        let imageName = "image1.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        return imageView
    }()
    
    // Inits the text area
    private let displayText: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Create", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 36)])
        attributedText.append(NSAttributedString(string: "\n\nWrite your own tap fiction story and publish them for others to read!", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.black]))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    // Inits next button
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(#imageLiteral(resourceName: "nextBtn"), for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // Inits counter dots
    private let firstDot: UIImageView = {
        let imageName = "pageActive.png"
        let image = UIImage(imageLiteralResourceName: imageName)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        return imageView
    }()
    
    private let secondDot: UIImageView = {
        let imageName = "pageInactive.png"
        let image = UIImage(imageLiteralResourceName: imageName)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        return imageView
    }()
    
    private let thirdDot: UIImageView = {
        let imageName = "pageInactive.png"
        let image = UIImage(imageLiteralResourceName: imageName)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        return imageView
    }()
    
    private let inactiveDot: UIImageView = {
        let imageName = "pageInactive.png"
        let image = UIImage(imageLiteralResourceName: imageName)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        return imageView
    }()
    
    private let activeDot: UIImageView = {
        let imageName = "pageActive.png"
        let image = UIImage(imageLiteralResourceName: imageName)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        return imageView
    }()
    
    // Creates swiping action
    func initSwipe() {
        // sets up swiping to the left (next)
        let swipeNext = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft(swipe:)))
        swipeNext.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeNext)
        
        //sets up swiping to the right (back)
        let swipeBack = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight(swipe:)))
        swipeBack.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeBack)
    }
    
    // When swiped to next page...
    @objc func swipeLeft(swipe:UISwipeGestureRecognizer) {
        tapCount += 1
        updateSwipeContent()
    }
    
    // When swiped to previous page...
    @objc func swipeRight(swipe:UISwipeGestureRecognizer) {
        tapCount -= 1
        updateSwipeContent()
    }
    
    // Next button has been tapped
    @objc func nextButtonTapped() {
        tapCount += 1
        updateSwipeContent()
    }

    // Updates image and text based off tap count
    func updateSwipeContent() {
        if tapCount == 0 {
           UIView.animate(withDuration: 0.20, animations: {
                self.displayText.alpha = 0
                self.displayImage.alpha = 0
                self.firstDot.image = self.activeDot.image
                self.secondDot.image = self.inactiveDot.image
            }, completion: {_ in
                self.displayImage.image = self.firstImage.image
                self.displayText.attributedText = self.firstText.attributedText
                self.displayText.alpha = 1
                self.displayImage.alpha = 1
            })
        } else if tapCount == 1 {
            UIView.animate(withDuration: 0.20, animations: {
                self.displayText.alpha = 0
                self.displayImage.alpha = 0
                self.firstDot.image = self.inactiveDot.image
                self.secondDot.image = self.activeDot.image
                self.thirdDot.image = self.inactiveDot.image
            }, completion: {_ in
                self.displayImage.image = self.secondImage.image
                self.displayText.attributedText = self.secondText.attributedText
                self.displayText.alpha = 1
                self.displayImage.alpha = 1
            })
        } else if tapCount == 2 {
            UIView.animate(withDuration: 0.20, animations: {
                self.displayText.alpha = 0
                self.displayImage.alpha = 0
                self.firstDot.image = self.inactiveDot.image
                self.secondDot.image = self.inactiveDot.image
                self.thirdDot.image = self.activeDot.image
            }, completion: {_ in
                self.displayImage.image = self.thirdImage.image
                self.displayText.attributedText = self.thirdText.attributedText
                self.displayText.alpha = 1
                self.displayImage.alpha = 1
            })
        } else if tapCount == 3 {
            tapCount = 2
        } else if tapCount == -1 {
            tapCount = 0
        }
    }
    
    // Checks if user has loaded the app before and will dismiss the onboarding screens
//    fileprivate func checkPreviousLoad() {
//        if UserDefaults.standard.bool(forKey: "firstLoad") == false  {
//            UserDefaults.standard.set(true, forKey: "firstLoad")
//        } else {
//            print("User has previously loaded the app")
//            // Loads next view controller
//            let vc = HomeViewController()
//            vc.modalPresentationStyle = .overFullScreen
//            self.present(vc, animated: true, completion: nil)
//    }
//}
    
    // There is probably a better way to do this
    private let firstImage: UIImageView = {
        let imageName = "image1.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let secondImage: UIImageView = {
        let imageName = "image2.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        return imageView
    }()
    
    private let thirdImage: UIImageView = {
        let imageName = "image3.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 400, height: 270)
        return imageView
    }()
    
    private let firstText: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Create", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 36)])
        attributedText.append(NSAttributedString(string: "\n\nWrite your own tap fiction story and publish them for others to read!", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.black]))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let secondText: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Write", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 36)])
        attributedText.append(NSAttributedString(string: "\n\nStart writing your story by tapping on a story block. Each story block represents a tap when reading.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.black]))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let thirdText: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Characters", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 36)])
        attributedText.append(NSAttributedString(string: "\n\nAssign characters to your story and have readers follow their journey.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.black]))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    // Sets image and text properties
    private func setupLayout() {
        view.addSubview(displayImage)
        view.addSubview(displayText)
        
        // Image icon constraints
        displayImage.translatesAutoresizingMaskIntoConstraints = false
        displayImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        displayImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        displayImage.widthAnchor.constraint(equalToConstant: 400).isActive = true
        displayImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        // Description contraints
        displayText.topAnchor.constraint(equalTo: displayImage.bottomAnchor, constant: 36).isActive = true
        displayText.widthAnchor.constraint(equalToConstant: 295).isActive = true
        displayText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        displayText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    // Sets control buttons and counter
    private func setupControls() {
        view.addSubview(nextButton)
        view.addSubview(firstDot)
        view.addSubview(secondDot)
        view.addSubview(thirdDot)
        
        // Next button constraints
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.centerYAnchor.constraint(equalTo: firstDot.centerYAnchor).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        // Dots constraints
        firstDot.translatesAutoresizingMaskIntoConstraints = false
        firstDot.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        firstDot.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        firstDot.heightAnchor.constraint(equalToConstant: 10).isActive = true
        firstDot.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        secondDot.translatesAutoresizingMaskIntoConstraints = false
        secondDot.leadingAnchor.constraint(equalTo: firstDot.trailingAnchor, constant: 7).isActive = true
        secondDot.centerYAnchor.constraint(equalTo: firstDot.centerYAnchor).isActive = true
        secondDot.heightAnchor.constraint(equalToConstant: 10).isActive = true
        secondDot.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        thirdDot.translatesAutoresizingMaskIntoConstraints = false
        thirdDot.leadingAnchor.constraint(equalTo: secondDot.trailingAnchor, constant: 7).isActive = true
        thirdDot.centerYAnchor.constraint(equalTo: firstDot.centerYAnchor).isActive = true
        thirdDot.heightAnchor.constraint(equalToConstant: 10).isActive = true
        thirdDot.widthAnchor.constraint(equalToConstant: 10).isActive = true
    }
}

