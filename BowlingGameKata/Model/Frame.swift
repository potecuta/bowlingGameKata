//
//  Frame.swift
//  BowlingGameKata
//
//  Created by Tudor Carare on 04/09/2017.
//  Copyright © 2017 Tudor Carare. All rights reserved.
//

import Foundation

protocol FrameType {
    
    func score() -> Int
}

protocol TenthFrameType: FrameType {
    
    
}



struct Frame: FrameType {

    
    public func score() -> Int {
        return 1
    }
}

struct TenthFrame: TenthFrameType {
    
    public func score() -> Int {
        return 1
    }
}
