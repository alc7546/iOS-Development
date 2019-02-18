//
//  WordSets.swift
//  magneto-hw
//
//  Created by Andrew Clark (RIT Student) on 2/17/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit


class WordSets{
    
    static let pirateWords =
    [
        "ahoy", "pirate", "and", "s", "ed", "d", "sail", "ship", "island", "eyepatch", "hook", "hand",
        "as", "but", "the", "siver", "gold", "bones", "skull", "cannon", "cutlass", "treasure", "loot",
        "battle", "fire", "parrot", "doubloon", "desert", "flag", "ocean", "water", "map", "scar",
        "plank", "walk"
    ]
    
    static let natureWords =
    [
        "ancient", "am", "almost", "about", "a", "&", "but", "breathe", "blanket", "be", "at", "as",
        "flower", "eden", "dusk", "dark", "by", "leave", "ing", "happy", "grass", "garden", "our", "of",
        "nature", "moss", "like", "lichen", "the", "sun", "soon", "see", "relax", "out", "with", "wind"
    ]
    
    static let spaceWords =
    [
        "the", "satellite", "is", "but", "and" ,"explore", "d", "ing", "star", "space", "astronaut",
        "alien", "s", "NASA", "station", "black hole", "comet", "Jupiter", "Mars", "nova", "super",
        "telescope", "sun", "solar", "wind", "system", "orbit", "lunar", "galaxy", "universe", "a",
        "at"
    ]
    
    
    var name:String
    var value: [String]
    
    init(name:String, value:[String]){
        self.name = name
        self.value = value
    }
    
}
