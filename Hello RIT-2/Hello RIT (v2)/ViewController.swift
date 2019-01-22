//
//  ViewController.swift
//  Hello RIT (v2)
// Running 9.2 xCode
//
//  Created by Andrew Clark (RIT Student) on 1/22/19.
//  Copyright © 2019 Andrew Clark. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var topLabel:UILabel! //! at the end is an implicitly wrapped optional - tells compiler that we'll initialize before using it
    var bottomLabel:UILabel!
    var footerLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Initialize variables
        topLabel = UILabel()
        bottomLabel = UILabel()
        footerLabel = UILabel()
        
        // Top Label
        topLabel.text = "Hello"
        topLabel.font = UIFont.systemFont(ofSize: 36)
        topLabel.sizeToFit()
        view.addSubview(topLabel)
        
        
        // Bottom Label
        bottomLabel.text = "RIT"
        bottomLabel.font = UIFont.boldSystemFont(ofSize: 48)
        bottomLabel.sizeToFit()
        view.addSubview(bottomLabel)
        
        // Background
        view.backgroundColor = UIColor.orange
        
        // Footer Label
        footerLabel.text = "Andrew Clark"
        footerLabel.font = UIFont.italicSystemFont(ofSize: 24)
        footerLabel.sizeToFit()
        footerLabel.textColor = UIColor.gray
        view.addSubview(footerLabel)
        // view.frame.width/height
        footerLabel.center = CGPoint(x:view.frame.width/2, y:view.frame.height - 50)
        
        
//        // Animation for Top Label
//        UIView.animate(withDuration: 0.9, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: { self.topLabel.center = CGPoint(x: 100, y:40+200)}, completion: {(done:Bool) in print("Animation finished - completed = \(done)")})
//
//        // Animation for Bottom Label
//        UIView.animate(withDuration:2.0,
//                       delay: 0.5,
//                       usingSpringWithDamping: 0.2,
//                       initialSpringVelocity:0.0,
//                       options: [],
//                       animations: animateBottomLabel,
//                       completion:{(done:Bool) in NSLog("Animation finished - completed = \(done)")}
//                       )
        animateLabels()
        
        // calls viewTapped() whenever this view is tapped
        let tapGesture = UITapGestureRecognizer(target:self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    
    // Animation for Bottom Label
    func animateBottomLabel(){
        self.bottomLabel.center = CGPoint(x:200, y:90+200)
        self.bottomLabel.alpha = 1.0
    }

    // viewTapped Method
    @objc func viewTapped(tapGesture:UITapGestureRecognizer){
        print(tapGesture)
        print(tapGesture.location(in: self.view))
        print("Num touches =\(tapGesture.numberOfTouches)")
        animateLabels()
    }
    
    // Animating labels
    func animateLabels(){
        // Set starting center and alpha for top/bottom labels
        
        // Top Label - Only needs center moved here
        topLabel.center = CGPoint(x:100, y:40)
        
        // Bottom Label
        bottomLabel.center = CGPoint(x: 200, y:90)
        // Hide the Bottom Label
        bottomLabel.alpha = 0
        bottomLabel.isOpaque = true
        
        // Animate Top Label
        UIView.animate(withDuration:0.9,
                       delay: 0.0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0.0,
                       options: [],
                       animations:{
                        self.topLabel.center = CGPoint(x:100, y:40+200)
                        },
                       completion:{(done:Bool) in print("Animation finished - completed\(done)")}
                       )
        
        // Animate Bottom Label
        UIView.animate(withDuration:2.0,
                       delay: 0.5,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity:0.0,
                       options: [],
                       animations: animateBottomLabel,
                       completion:{(done:Bool) in NSLog("Animation finished - completed = \(done)")}
                       )
        
    }


}

