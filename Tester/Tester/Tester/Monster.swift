//
//  Monster.swift
//  Tester
//
//  Created by Student on 4/9/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class Monster{
    var name:String
    var level:Int
    var hitPoints:Int
    
    init(name:String, level:Int, hitPoints:Int){
        self.name = name
        self.level = level
        self.hitPoints  = hitPoints
        self.name = validateName(name)
    }
    
    private func validateName(_ str:String)->String{
        return str.replacingOccurrences(of: ",", with: "")
    }
}
