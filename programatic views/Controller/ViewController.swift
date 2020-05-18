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
        initSwipe()
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
    
//    @objc func nextButtonTapped() {
//        tapCount += 1
//        pageCounter.currentPage += 1
//        updatePageContent()
//    }
//
//    @objc func backButtonTapped() {
//        tapCount -= 1
//        pageCounter.currentPage -= 1
//        updatePageContent()
//    }
    
    // Changes image and text based off the var tapCount
//    func updatePageContent() {
//        if tapCount == -1 {
//            tapCount = 0
//        } else if tapCount == 0 {
//            displayImage.image = facebookImage.image
//        } else if tapCount == 1 {
//            displayImage.image = twitterImage.image
//            displayText.attributedText = twitterText.attributedText
//        } else if tapCount == 2 {
//            displayImage.image = instagramImage.image
//            displayText.attributedText = instagramText.attributedText
//        } else if tapCount == 3 {
//            displayImage.image = linkedinImage.image
//            displayText.attributedText = linkedinText.attributedText
//            nextButton.setTitle("NEXT", for: .normal)
//        } else if tapCount == 4 {
//            displayImage.image = youtubeImage.image
//            displayText.attributedText = youtubeText.attributedText
//            nextButton.setTitle("DONE", for: .normal)
//        } else if tapCount == 5 {
//            tapCount = 4
//            loadHomeView()
//            print("Load next view")
//        }
//    }
    
    // Creates swiping feature
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

    // Updates image and text based off tap count
    func updateSwipeContent() {
        pageCounter.currentPage = tapCount
        
        if tapCount == 0 {
           UIView.animate(withDuration: 0.20, animations: {
                self.displayText.alpha = 0
                self.displayImage.alpha = 0
            }, completion: {_ in
                self.displayImage.image = self.firstImage.image
                self.displayText.attributedText = self.firstText.attributedText
                self.displayText.alpha = 1
                self.displayImage.alpha = 1
            })
            
        }   else if tapCount == 1 {
            UIView.animate(withDuration: 0.20, animations: {
                self.displayText.alpha = 0
                self.displayImage.alpha = 0
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
            }, completion: {_ in
                self.displayImage.image = self.thirdImage.image
                self.displayText.attributedText = self.thirdText.attributedText
                self.displayText.alpha = 1
                self.displayImage.alpha = 1
            })
            
        } else if tapCount == 3 {
            UIView.animate(withDuration: 0.20, animations: {
                self.displayText.alpha = 0
                self.displayImage.alpha = 0
            }, completion: {_ in
                self.displayImage.image = self.fourthImage.image
                self.displayText.attributedText = self.fourthText.attributedText
                self.displayText.alpha = 1
                self.displayImage.alpha = 1
            })
            
        } else if tapCount == 4 {
            UIView.animate(withDuration: 0.20, animations: {
                self.displayText.alpha = 0
                self.displayImage.alpha = 0
            }, completion: {_ in
                self.displayImage.image = self.fithImage.image
                self.displayText.attributedText = self.fifthText.attributedText
                self.displayText.alpha = 1
                self.displayImage.alpha = 1
            })
            
        } else if tapCount == 5 {
            tapCount = 4
        } else if tapCount == -1 {
            tapCount = 0
        }
    }
    
    // When swiped to next obj...
    @objc func swipeLeft(swipe:UISwipeGestureRecognizer) {
        tapCount += 1
        updateSwipeContent()
    }
    // When swiped to previous obj...
    @objc func swipeRight(swipe:UISwipeGestureRecognizer) {
        tapCount -= 1
        updateSwipeContent()
    }
    
    // Loads next view controller
    fileprivate func loadHomeView() {
        let vc = HomeViewController()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    // Inits pagecounter
    private let pageCounter: UIPageControl = {
        let control = UIPageControl()
        control.currentPage = 0
        control.numberOfPages = 5
        control.currentPageIndicatorTintColor = .systemBlue
        control.pageIndicatorTintColor = .gray
        return control
    }()
    
    // There has to be a better way to do this
    private let firstImage: UIImageView = {
        let imageName = "facebook_icon.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let secondImage: UIImageView = {
        let imageName = "twitter_icon.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let thirdImage: UIImageView = {
        let imageName = "instagram_icon.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let fourthImage: UIImageView = {
        let imageName = "linkedin_icon.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let fithImage: UIImageView = {
        let imageName = "youtube_icon.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let firstText: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Like us on Facebook", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\nFirst object Text Lorem ipsum Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let secondText: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Follow us on Twitter", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\nSecond object text Lorem ipsum Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let thirdText: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Follow us on Instagram", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\nThird object text Lorem ipsum Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let fourthText: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Follow us on LinkedIn", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\nFourth object text nLorem ipsum Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let fifthText: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Subscribe to us on YouTube", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\nFifth object text Lorem ipsum Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.gray]))
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
        view.addSubview(pageCounter)
                
        // Counter contsraints
        pageCounter.translatesAutoresizingMaskIntoConstraints = false
        pageCounter.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        pageCounter.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
}

