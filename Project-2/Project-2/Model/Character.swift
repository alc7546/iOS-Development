//
//  CharacterData.swift
//  Project-2
//
//  Created by Andrew Clark (RIT Student) on 5/2/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import Foundation
import UIKit

// Character Class

public class Character: NSObject{
    private(set) var name: String
    private(set) var bio:String
    private(set) var mainImage:UIImage // try as an image first
    private(set) var rosterIcon:UIImage
    
    

    
    init(name:String, bio:String, mainImage:UIImage, rosterIcon:UIImage){
        self.name = name
        self.bio = bio
        self.mainImage = mainImage
        self.rosterIcon = rosterIcon
    }
    
    public override var description: String{
        return "\(name) \(bio) \(mainImage) \(rosterIcon)"
    } 
}
