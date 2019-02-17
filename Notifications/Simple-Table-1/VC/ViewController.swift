//
//  ViewController.swift
//  Simple-Table-1
//
//  Created by Andrew Clark (RIT Student) on 2/11/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit

//Global
let myColorChangedNotification = NSNotification.Name("colorChangedNotification")
let isPad = UIDevice.current.userInterfaceIdiom == .pad
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // get notification center - it's a singleton
        let nc = NotificationCenter.default
        
        // register as an observer
        nc.addObserver(self, selector: #selector(colorChanged), name: myColorChangedNotification, object: nil)
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
    
    //MARK: - Notifications -
    @objc func colorChanged(n:Notification){
        // pull data dictionary out of the notification
        let d = n.userInfo!
        let color = d["color"] as! UIColor
        
        // change background color
        self.view.backgroundColor = color
    }
    
    //MARK: - Cleanup-
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    

}

