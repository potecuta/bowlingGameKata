//
//  Roll.swift
//  BowlingGameKata
//
//  Created by Tudor Carare on 04/09/2017.
//  Copyright © 2017 Tudor Carare. All rights reserved.
//

import Foundation

protocol RollType {
    
    var pins: Int { get set }
}

struct Roll: RollType {
    
    var pins: Int
    
}
