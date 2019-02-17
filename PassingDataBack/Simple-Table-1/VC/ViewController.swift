//
//  ViewController.swift
//  Simple-Table-1
//
//  Created by Andrew Clark (RIT Student) on 2/11/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "showColorSegue"{
            let colorsVC = segue.destination.childViewControllers[0] as! ColorsTableVC
            //colorsVC.colors = ["cyan","magenta", "yellow"]
            colorsVC.title = "Choose a color"
        }
    }
    
    //MARK: - Storyboard Actions -
    @IBAction func unwindToMain(segue:UIStoryboardSegue){
        if segue.identifier == "DoneTapped"{
            let colorVC = segue.source as! ColorsTableVC
            let color = colorVC.selectedColor
            self.view.backgroundColor = color
        }
    }

}

