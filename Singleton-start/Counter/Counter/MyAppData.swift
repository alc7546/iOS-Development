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
    var counterTotal = 0
    var dateString = "Last used: never"
    let counterKey = "counterKey"
    let dateStringKey = "dateStringKey"
    
    private init(){ // 2 - private initializer can't be called from outside
        print("Created MyAppData instance")
    }
}
