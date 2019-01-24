//
//  ViewController.swift
//  Motivator-ICE
//
//  Created by Andrew Clark (RIT Student) on 1/24/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var label:UILabel! // telling the compiler that we promise to set this value before running
    var veggieButton:UIButton!
    var motivatorLabel:UILabel!
    var studyButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Label
        label = (view.viewWithTag(200) as! UILabel)
        label.text = "Tap a button to get motivated!"
        label.textColor = UIColor.white
        
        // Button
        veggieButton = (view.viewWithTag(100) as! UIButton)
        veggieButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        // Motivator Label
        motivatorLabel = (view.viewWithTag(300) as! UILabel)
        motivatorLabel.textColor = UIColor.white
        
        // Study Button
        studyButton = (view.viewWithTag(400) as! UIButton)
        studyButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        // Change background color
        self.view.backgroundColor = UIColor.black
    }

    override func viewDidLayoutSubviews() {
        let screenWidth = view.frame.width
        let screenHeight = view.frame.height
        let margin:CGFloat = 20
        var x = margin
        var y = 100 + margin
        let width = screenWidth - margin * 2
        label.frame = CGRect(x:x,y: screenHeight / 3,width:width,height:100)
        //label.backgroundColor = UIColor.yellow
        
        // Button Sizings
        x = screenWidth / 2
        y = screenHeight - 35 - margin
        
        // New Label
        motivatorLabel.font = .systemFont(ofSize: screenHeight / 15)
        motivatorLabel.sizeToFit()
        motivatorLabel.center = CGPoint(x: x, y: screenHeight * 0.1)
        
        // Font Sizes - here or in viewDidLoad?
        studyButton.titleLabel?.font = .systemFont(ofSize: screenHeight / 30)
        studyButton.sizeToFit() // fit in frame
        veggieButton.titleLabel?.font = .systemFont(ofSize: screenHeight / 30)
        veggieButton.sizeToFit() // fit in frame
        
        // Center the buttons - done after the font sizes, as these can change their orientations
        veggieButton.center = CGPoint(x: x, y: y)
        studyButton.center = CGPoint(x:x, y: y * 0.95) // 5% above bottom button
        
        
    }
   
    @objc func buttonTapped(sender:UIControl){
        if sender.tag == 100{
            label.text = "Eat Veggies and you will lose weight!"
        }
        else if sender.tag == 400{
            label.text = "Study hard and you will do well in school!"
        }
    }


}

