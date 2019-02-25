//
//  MyAppData.swift
//  Counter
//
//  Created by Student on 2/21/19.
//  Copyright © 2019 Ima Student. All rights reserved.
//

import Foundation

class MyAppData{
    static let shared = MyAppData() // 1 - Single instance is a class constant
    var counterTotal:Int = 0{
        didSet{
            let defaults = UserDefaults.standard
            defaults.set(counterTotal, forKey: counterKey)
        }
    }
    let counterKey = "counterKey"
    let dateStringKey = "dateStringKey"
    let launchKey = "launchKey"
    var dateString = "Last used: never"{
        didSet{
            let defaults = UserDefaults.standard
            defaults.set(dateString, forKey: dateStringKey)
        }
    }
    var launchTotal:Int = 0{
        didSet{
            let defaults = UserDefaults.standard
            defaults.set(launchTotal, forKey: launchKey)
        }
    }
    
    private init(){ // 2 - private initializer can't be called from outside
        print("Created MyAppData instance")
        readDefaultsData()
    }
    
    private func readDefaultsData(){
        let defaults = UserDefaults.standard
        counterTotal = defaults.integer(forKey: counterKey)
        launchTotal = defaults.integer(forKey: launchKey)
        
        if let s = defaults.object(forKey: dateStringKey){
            dateString = s as! String
        } else {
            dateString = "Welcome to Counter"
        }
    }
}
