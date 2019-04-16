//
//  Monster.swift
//  TesterICE
//
//  Created by Andrew Clark (RIT Student) on 4/15/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import Foundation
class Monster{
    var minLevel = 1
    var maxLevel = 100
    var minHitpoints = 0
    var name:String{
        didSet{
            self.name = validateName(name)
        }
    }
    var level:Int{
        didSet{
            self.level = validateNumber(num: level, min: minLevel, max: maxLevel)
        }
    }
    var hitPoints:Int{
        didSet{
            self.hitPoints = validateNumber(num: hitPoints, min: minHitpoints, max: (level * 20))
        }
    }
    
    var isAlive:Bool{
        if(hitPoints > 0){
            return true
        }
        else{ return false }
    }
    
    // Instead of computer property, I just created a function to manage the mins/maxes for the level/hitpoint
    // Still wrote it down below - calculates it based off of level
    // var maxHitpoints:Int{
    //  get{
    //      return level * 20
    //  }
    //  set(newLevel){
    //      return hitPoints = newLevel * 20
    //
    init(name:String, level:Int, hitPoints:Int){
        self.name = name
        self.level = level
        self.hitPoints  = hitPoints
        self.name = validateName(name)
        self.level = validateNumber(num: level, min: 1, max: 100)
        self.hitPoints = validateNumber(num: hitPoints, min: 0, max: (level*20))
    }
    
    private func validateName(_ str:String)->String{
        return str.replacingOccurrences(of: ",", with: "")
    }
    
    // Validate number based off mins/max
    private func validateNumber(num:Int, min:Int, max:Int)->Int{
        var number = num
        if(num < min){
            number = min
        }
        else if(num > max){
            number = max
        }
        return number
    }
    
    func slay(){
        self.hitPoints = 0
    }
}
