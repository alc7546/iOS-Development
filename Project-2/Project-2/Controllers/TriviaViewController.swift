//
//  TriviaViewController.swift
//  Project-2
//
//  Created by Andrew Clark (RIT Student) on 5/2/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit

class TriviaViewController: UIViewController{
    
    @IBOutlet weak var triviaLabel:UILabel!
    let triviaStrings:[String] = ["The original Mortal Kombat was developed by four people in only 10 months"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    @IBAction func triviaButtonPressed(sender: UIButton){
        let randomNum = Int(arc4random_uniform(UInt32(triviaStrings.count - 1)) + 0)
        triviaLabel.text = triviaStrings[randomNum]
        triviaLabel.numberOfLines=0
        triviaLabel.sizeToFit()
    }
}
