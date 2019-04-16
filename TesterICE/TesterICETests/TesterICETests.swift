//
//  TesterICETests.swift
//  TesterICETests
//
//  Created by Andrew Clark (RIT Student) on 4/15/19.
//  Copyright © 2019 Andrew Clark (RIT Student). All rights reserved.
//

import XCTest
@testable import TesterICE

class TesterICETests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_MonsterInit(){
        let m1 = Monster(name: "Orc", level: 2, hitPoints: 15)
        XCTAssert(m1.name == "Orc", "Monster.name initializer failed")
        XCTAssert(m1.level == 2, "Monster.level initializer failed")
        XCTAssert(m1.hitPoints == 15, "Monster.hitPoints initializer failed")
    }
    
    func test_MonsterInit_name_no_commas(){
        let m1 = Monster(name: "Half,Orc", level: 2, hitPoints: 15)
        XCTAssertFalse(m1.name.contains(","), "Monster.name contains a comma")
    }
    
    func test_Monster_Name_setter(){
        let m1 = Monster(name: "Goblin", level: 2, hitPoints: 15)
        m1.name = "Half,Orc"
        XCTAssertFalse(m1.name.contains(","), "Monster.name contains a comma")
        print(m1.name)
    }
    
    func test_Monster_level_setter(){
        let m1 = Monster(name:"Andrew", level:200, hitPoints: 15)
        XCTAssertFalse(m1.level > 100, "Monster.level maximum has been exceeded")
        m1.level = -50
        XCTAssertFalse(m1.level < 0, "Monster.level minimum has been exceeded")
    }
    
    func test_Monster_hitpoints_setter(){
        let m1 = Monster(name:"Andrew", level:5, hitPoints:-5)
        XCTAssertFalse(m1.hitPoints < 0, "Monster.hitpoints minimum has been exceeded")
        m1.hitPoints = 500
        XCTAssertFalse(m1.hitPoints > (m1.level * 20), "Monster.hitpoints maximum has been exceeded")
    }
    
    func test_Monster_alive(){
        let m1 = Monster(name:"Andrew", level:5, hitPoints:5)
        XCTAssertTrue(m1.isAlive, "Monster is  alive")
        m1.hitPoints = 0
        XCTAssertTrue(!m1.isAlive, "Monster is dead")
    }
    
    func test_Monster_slay(){
        let m1 = Monster(name:"Andrew", level:5, hitPoints:5)
        XCTAssertTrue(m1.isAlive, "Monster is alive")
        m1.slay()
        XCTAssertTrue(!m1.isAlive, "Monster is dead")
    }
    
}
