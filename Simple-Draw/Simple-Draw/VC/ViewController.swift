//
//  ViewController.swift
//  Simple-Draw
//
//  Created by Andrew Clark (RIT Student) on 4/10/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var customView: CustomView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        customView.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Action Methods -
    @IBAction func setCanvasColor(sender:AnyObject){
        switch sender.tag{
            case 1:
                customView.backgroundColor = UIColor.white
                break
            case 2:
                customView.backgroundColor = UIColor.yellow
                break
            default:
                customView.backgroundColor = UIColor.white
        }
    } 
    
    @IBAction func cls(sender:AnyObject){
        customView.cls()
    }
    
    @IBAction func undo(sender:AnyObject){
        customView.undo()
    }
    
    @IBAction func share(sender:AnyObject){
        let image = customView.takeSnapshot()
        let activity = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        activity.popoverPresentationController?.barButtonItem = sender as? UIBarButtonItem
        present(activity, animated: true, completion: nil)
    }

}

