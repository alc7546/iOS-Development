//
//  ViewController.swift
//  ColorSwitch
//
//  Created by Andrew Clark (RIT Student) on 3/7/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var swatchView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Set black background for main view
        self.view.backgroundColor = UIColor.black
        self.swatchView.layer.borderWidth = 1
        self.swatchView.layer.borderColor = UIColor.white.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changedValue(_ sender: Any) {
        var redValue = 0.0
        var greenValue = 0.0
        var blueValue = 0.0
        if(redSwitch.isOn){
            redValue = 1.0
        }
        if(greenSwitch.isOn){
           greenValue = 1.0
        }
        if(blueSwitch.isOn){
            blueValue = 1.0
        }
        
        swatchView.backgroundColor = UIColor(red:CGFloat(redValue), green: CGFloat(greenValue), blue:CGFloat(blueValue), alpha:1.0)
    }
    
}

