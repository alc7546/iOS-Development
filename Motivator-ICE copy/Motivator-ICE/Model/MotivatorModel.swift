//
//  MotivatorModel.swift
//  Motivator-ICE
//
//  Created by Student on 1/29/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import Foundation


class MotivatorModel{
    let data = [
        100: "Eat Veggies and you will lose weight!",
        400: "Study hard and you will do well in school!"
        
    ]
    
    let bromides:[String] = [
        "All that glitters is gold",
        "Only time will tell",
        "Read between the line",
        "Just a matter of time",
        "Someone woke up on the wrong side of the bed"
    ]
    
    func getBromide(key:Int)->String{
        //return data[key]
        // optional binding
        // if true assigns value to const
       if let bromide = data[key]{
           return bromide
       }
       else if(key == 401){
        return getRandomBromide()
       }
       else{ // throw that error yeet
           return "Bromide number \(key) not found!"
       }
        
    }
    
    func getRandomBromide()->String{
        return bromides[Int.random (in: 0..<bromides.count)]
    }
    
//    func eatVeggies()->String{
//        return "Eat Veggies and you will lose weight!"
//    }
//
//    func study()->String{
//        return "Study hard and you will do well in school!"
//    }
}
