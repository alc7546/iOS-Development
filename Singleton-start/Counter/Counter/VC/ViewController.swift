//
//  ViewController.swift
//  Counter
//
//  Created by jefferson on 2/20/19.
//  Copyright © 2019 Ima Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var launchLabel: UILabel!
    
    
    var cb:CounterBrain!
    // an "Immediately Invoked Closure Expression"  - IICE - "Icky"
    var formatter:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cb = CounterBrain(total: MyAppData.shared.counterTotal)
        //cb = CounterBrain(total: UserDefaults.standard.integer(forKey: "counter"))
        totalLabel.text = String(cb.total)
        dateLabel.text = MyAppData.shared.dateString
        MyAppData.shared.launchTotal+=1
        launchLabel.text = "Launch Times: \(MyAppData.shared.launchTotal)"
        
    }

    @IBAction func clearTapped(_ sender: Any) {
        cb.clear()
        displayTotal()
    }
    @IBAction func plusTapped(_ sender: Any) {
        cb.increment()
        displayTotal()
    }
    
    @IBAction func minusTapped(_ sender: Any) {
        cb.decrement()
        displayTotal()
    }
    
    
    // MARK: - Helpers -
    private func displayTotal(){
        //UserDefaults.standard.set(cb.total, forKey:"counter")
        totalLabel.text = String(cb.total)
        displayDate()
        MyAppData.shared.counterTotal = cb.total // save counter Total
    }
    
    private func displayDate(){
        let date = Date()
        let dateString = formatter.string(from: date)
        dateLabel.text = "Last used: \(dateString)"
        MyAppData.shared.dateString = dateLabel.text!
    }
    

}

