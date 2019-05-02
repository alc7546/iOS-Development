//
//  NavController.swift
//  Project-2
//
//  Created by Andrew Clark (RIT Student) on 5/2/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit

class NavController: UINavigationController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let viewControllers = self.viewControllers{
            for vc in viewControllers{
                if let vc = vc as? ViewController{
                    vc.rosters = Roster.shared
                }
            }
        }
    }
}
