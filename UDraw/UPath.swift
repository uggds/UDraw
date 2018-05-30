//
//  UDrawPath.swift
//  UDraw
//
//  Created by Seiya Ugajin on 2018/05/27.
//  Copyright © 2018年 Seiya Ugajin. All rights reserved.
//

import Foundation

public protocol UPathElement {
}

extension CGPoint {
    func middle(_ from:CGPoint) -> CGPoint {
        return CGPoint(x: (self.x + from.x)/2, y: (self.y + from.y)/2)
    }
    
    // デルタ（２点間の差分）
    func delta(_ from:CGPoint) -> CGPoint {
        return CGPoint(x: self.x - from.x, y: self.y - from.y)
    }
    
    // 内積
    func dotProduct(_ with:CGPoint) -> CGFloat {
        return self.x * with.x + self.y * with.y
    }
    
    func distance2(_ from:CGPoint) -> CGFloat {
        let delta = self.delta(from)
        return delta.dotProduct(delta)
    }
    
    func distance(_ from:CGPoint) -> CGFloat {
        return sqrt(self.distance2(from))
    }
    
    func translate(x:CGFloat, y:CGFloat) -> CGPoint {
        return CGPoint(x: self.x + x, y: self.y + y)
    }
}
