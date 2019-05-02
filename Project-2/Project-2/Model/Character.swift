//
//  CharacterData.swift
//  Project-2
//
//  Created by Andrew Clark (RIT Student) on 5/2/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import Foundation
import UIKit


public class Character: NSObject{
    private var name: String
    private var bio:String
    private var mainImage:UIImage // try as an image first
    
    public var charName:String?{
        return name
    }
    
    init(name:String, bio:String, mainImage:UIImage){
        self.name = name
        self.bio = bio
        self.mainImage = mainImage
    }
    
    public override var description: String{
        return "\(name) \(bio) \(mainImage)"
    } 
}
