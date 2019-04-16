//
//  DetailsViewController.swift
//  Project-2
//
//  Created by Andrew Clark (RIT Student) on 4/15/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var myTitle:UILabel?
    var titleText: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        myTitle?.text = titleText
        // Do any additional setup after loading the view.
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
