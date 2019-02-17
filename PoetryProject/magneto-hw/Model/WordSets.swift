//
//  WordSets.swift
//  magneto-hw
//
//  Created by Andrew Clark (RIT Student) on 2/17/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit


class WordSets{
    
    static let words1 =
        [
            "could","cloud","bot","bit","ask","a","geek","flame","file","ed","ed",
            "create","like","lap","is","ing","I","her","drive","get","soft","screen",
            "protect","online","meme","to","they","that","tech","space","source","y","write","while"
    ]
    
    static let words2 =
        [
            "ancient", "am", "almost", "about", "a", "&", "but", "breathe", "blanket", "be", "at", "as",
            "flower", "eden", "dusk", "dark", "by", "leave", "ing", "happy", "grass", "garden", "our", "of",
            "nature", "moss", "like", "lichen", "the", "sun", "soon", "see", "relax", "out", "with", "wind"
    ]
    
    
    var name:String
    var value: [String]
    
    init(name:String, value:[String]){
        self.name = name
        self.value = value
    }
    
}
