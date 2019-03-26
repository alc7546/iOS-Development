//
//  ParkData.swift
//  ParkFinder
//
//  Created by Student on 3/26/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import Foundation

class ParkData{
    static let shared = ParkData()
    
    var parks = [StatePark]() 
    private init(){
        
    }
}
