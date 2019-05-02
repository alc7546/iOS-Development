//
//  Roster.swift
//  Project-2
//
//  Created by Andrew Clark (RIT Student) on 5/2/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import Foundation

class Roster{
    static let shared = Roster()
    
    var characters = [Character]()
    private init(){
    }
}
