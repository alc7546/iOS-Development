//
//  MyTabBarController.swift
//  ParkFinder
//
//  Created by Andrew Clark (RIT Student) on 3/29/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let viewControllers = self.viewControllers{
            for vc in viewControllers{
                if let vc = vc as? ViewController{
                    print("VIEW")
                    vc.parkData = ParkData.shared
                }
                
                if let vc = vc as? UINavigationController, let topVC = vc.topViewController as? ParksTableVC{
                    topVC.parkData = ParkData.shared
                }
            }
        }
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
