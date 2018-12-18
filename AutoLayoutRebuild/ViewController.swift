//
//  ViewController.swift
//  AutoLayoutRebuild
//
//  Created by Danni on 12/17/18.
//  Copyright © 2018 Danni Chen. All rights reserved.
//

import UIKit

extension UIColor{
    static var mainPink = UIColor(displayP3Red: 255/255, green: 125/205, blue: 204/255, alpha: 1)
}

class ViewController: UIViewController {
    
    //TODO:Create a collection view to implement swipping through pages
    
    private let bearImageView:UIImageView = {
        let bearImage = UIImage(named: "bear_first")
        var imageView = UIImageView()
        imageView.image = bearImage
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let descriptionTextView:UITextView = {
        let textView = UITextView()
        textView.text = "Join us Today!"
        textView.font = .boldSystemFont(ofSize: 18)
        let attributedString = NSMutableAttributedString(string: "Join us today", attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 18)])
        attributedString.append(NSAttributedString(string: "\n\n\nAre you ready for loads of loads of fun? Don't wait any longer, we are looking forward to seeing you soon", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 13)]))
        textView.attributedText = attributedString
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let previousButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("prev", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nextButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("next", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let pageControl:UIPageControl = {
        let controler = UIPageControl()
        controler.currentPage = 0
        controler.currentPageIndicatorTintColor = .red
        controler.numberOfPages = 3
        controler.pageIndicatorTintColor = .mainPink
        controler.translatesAutoresizingMaskIntoConstraints = false
        return controler
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTopView()
        setUpPageControllerView()
    }
    
    private func setUpTopView(){
//        set up a topContainer to hold bearImage
        let topContainer = UIView()
        view.addSubview(topContainer)
        topContainer.addSubview(bearImageView)
//        Anchor the topContainer with respect to viewController
        topContainer.translatesAutoresizingMaskIntoConstraints = false
        topContainer.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        topContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        topContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        topContainer.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
//        Anchor the bearImage with respect to topContrainer
        bearImageView.centerXAnchor.constraint(equalTo: topContainer.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor).isActive = true
        bearImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bearImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
       
        view.addSubview(descriptionTextView)
//        Anchor the description textView
        descriptionTextView.topAnchor.constraint(equalTo: topContainer.bottomAnchor, constant: 30).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 50).isActive = true
        
    }
    private func setUpPageControllerView(){
        let bottomStackView = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        
        bottomStackView.distribution = .fillEqually
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bottomStackView)
//        Anchor the bottomStackView with respect to view
        bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomStackView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    


}

