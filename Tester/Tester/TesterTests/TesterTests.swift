//
//  TesterTests.swift
//  TesterTests
//
//  Created by Student on 4/9/19.
//  Copyright © 2019 Student. All rights reserved.
//

import XCTest
@testable import Tester

class TesterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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

}
