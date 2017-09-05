//
//  BowlingGameKataTests.swift
//  BowlingGameKataTests
//
//  Created by Tudor Carare on 04/09/2017.
//  Copyright © 2017 Tudor Carare. All rights reserved.
//

import XCTest
@testable import BowlingGameKata

class BowlingGameKataTests: XCTestCase {
    
    var game: Game!
    
    override func setUp() {
        super.setUp()
        game = Game()
    }
    
    override func tearDown() {
        game = nil
        
        super.tearDown()
    }
    
    func testGutterExample() {
        
        roll(times: 20, noOfPins: 0)
        XCTAssertEqual(0, game.score)
    }
    
    func testAllOnes() {
        
        roll(times: 20, noOfPins: 1)
        XCTAssertEqual(20, game.score)
    }
    
    func testOneSpare() {
        rollSpare()
        game.roll(3)
        roll(times: 17, noOfPins: 0)
        XCTAssertEqual(16, game.score)
    }
    
    func testOneStrike() {
        rollStrike()
        game.roll(3)
        game.roll(4)
        roll(times: 16, noOfPins: 0)
        XCTAssertEqual(24, game.score)
    }
    
    func testPerfectGame() {
        roll(times: 12, noOfPins: 10)
        XCTAssertEqual(300, game.score)
    }
    
    private func roll(times: Int, noOfPins pins: Int) {
        for _ in 0..<times {
            game.roll(pins)
        }
    }
    
    private func rollStrike() {
        game.roll(10)
    }
    
    private func rollSpare() {
        game.roll(5)
        game.roll(5)
    }
}
