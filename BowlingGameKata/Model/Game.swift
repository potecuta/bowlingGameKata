//
//  Game.swift
//  BowlingGameKata
//
//  Created by Tudor Carare on 04/09/2017.
//  Copyright © 2017 Tudor Carare. All rights reserved.
//

import Foundation

protocol GameType {
    
    mutating func roll(_ pins: Int)
    
    var score: Int { get }
}

struct Game: GameType {
    
    private var rolls: [Int] = [Int]()
    
    mutating public func roll(_ pins: Int) {
        rolls.append(pins)
    }
    
    public var score: Int {
        return computeScore()
    }
    
    
    private func computeScore() -> Int {
        var score = 0
        var frameIndex = 0
        for _ in 0..<10 {
            if isStrike(frameIndex) {
                score += rolls[frameIndex]
                score += strikeBonus(for: frameIndex)
                frameIndex+=1
            } else if isSpare(frameIndex) {
                score += sumOfBalls(for: frameIndex)
                score += spareBonus(for: frameIndex)
                frameIndex+=2
            } else {
                score += sumOfBalls(for: frameIndex)
                frameIndex+=2
            }
        }

        return score
    }
    
    private func isSpare(_ frameIndex: Int) -> Bool {
        let frameScore = rolls[frameIndex] + rolls[frameIndex+1]
        return frameScore == 10
    }
    
    private func isStrike(_ frameIndex: Int) -> Bool {
        return rolls[frameIndex] == 10
    }
    
    private func sumOfBalls(for frame: Int) -> Int {
        return rolls[frame] + rolls[frame+1]
    }
    
    private func strikeBonus(for frame: Int) -> Int {
        return rolls[frame+1] + rolls[frame+2]
    }
    
    private func spareBonus(for frame: Int) -> Int {
        return rolls[frame+2]
    }
}

