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
    let triviaStrings:[String] = [
                                    "The original Mortal Kombat was developed by four people in only 10 months.",
                                    "The Mortal Kombat franchise is largely responsible for the formation of the ESRB.",
                                    "A character in previous games called 'Rain' is inspired off of Prince's hit song 'Purple Rain'.",
                                    "The character Noob Saibot is named after creators John Tobias and Ed Boon, but backwards.",
                                    "The only character to be playable in all games in the series has been Sub-Zero.",
                                    "The games are known for their over the top blood, but none of the films are bloody.",
                                    "Sub-Zero's classic 'Spine Rip' fatality was inspired from the original Predator movie.",
                                    "The first Mortal Kombat was supposed to be a spinoff game starring Jean Claude Van Damme.",
                                    "Friendship finishers were added in the second game to offset the backlash to the blood effects.",
                                    "Many characters have been inspired by fan-creations, such as Skarlet or Ermac.",
                                    "The first secret character to appear in the series was Reptile, based off of Sub-Zero.",
                                    "The only game to not feature Scorpion was Mortal Kombat 3.",
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "CharacterBackground"))
        
    }
    
    @IBAction func triviaButtonPressed(sender: UIButton){
        let randomNum = Int(arc4random_uniform(UInt32(triviaStrings.count - 1)) + 0)
        triviaLabel.text = triviaStrings[randomNum]
        triviaLabel.numberOfLines=0
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
