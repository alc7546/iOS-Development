//
//  TestModel.swift
//  Project-2
//
//  Created by Andrew Clark (RIT Student) on 4/22/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import UIKit

class TestModel{
    static let test = TestModel()
    let name = "Erron"
    let mainImage = #imageLiteral(resourceName: "ErronBlack")
    let bio = """
                The best shot in Texas left home to seek adventure and
                excitement in Outworld with Kano and the Black Dragon.
                Outworld turned out to be the playground of Erron's
                ultraviolent dreams. He decided to make his home there
                as the dealiest outlander in Outworld.
                """
    private init(){
        print("Created Tester Data")
    }
}
