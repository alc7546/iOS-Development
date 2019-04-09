//
//  ViewController.swift
//  Crashy-Start
//
//  Created by jefferson on 4/7/19.
//  Copyright © 2019 Ima Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    var colors = ["red","green","blue"]
    var dictionary = ["First Officer" : "Commander Riker", "Science Officer" : "Commander Data"]
    var myIndex = 0
    var myText:String! = "Commander Riker"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doStupidStuff()
        label.text = colors[myIndex]
        label2.text = myText.uppercased()
        //label2.text = myText?.uppercased -> "Only if myText has a value, then uppercase it. Need String var to be ? not !
    }
    
    func doStupidStuff(){
        myIndex = colors.count - 1
        myText = dictionary["Captain"] ?? "Not found"
    }


}

