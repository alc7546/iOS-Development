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

    var topLabel:UILabel = UILabel()
    var bottomLabel:UILabel = UILabel()
    var footerLabel:UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        topLabel.text = "Hello"
        topLabel.font = UIFont.systemFont(ofSize: 36)
        topLabel.sizeToFit()
        view.addSubview(topLabel)
        topLabel.center = CGPoint(x:100, y:40)
        
        bottomLabel.text = "RIT"
        bottomLabel.font = UIFont.boldSystemFont(ofSize: 48)
        bottomLabel.sizeToFit()
        view.addSubview(bottomLabel)
        bottomLabel.center = CGPoint(x: 200, y:90)
        
        view.backgroundColor = UIColor.orange
        
        footerLabel.text = "Andrew Clark"
        footerLabel.font = UIFont.italicSystemFont(ofSize: 24)
        footerLabel.sizeToFit()
        footerLabel.textColor = UIColor.gray
        view.addSubview(footerLabel)
        // view.frame.width/height
        footerLabel.center = CGPoint(x:view.frame.width/2, y:view.frame.height - 50)
        
        
    }

    


}

