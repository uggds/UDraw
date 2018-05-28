//
//  UPathBuilder.swift
//  UDraw
//
//  Created by Seiya Ugajin on 2018/05/27.
//  Copyright © 2018年 Seiya Ugajin. All rights reserved.
//

import Foundation

public struct UPathBuilder {
    private var path = CGMutablePath()
    
    init() {
    }
    
    public mutating func start(_ pt:CGPoint) -> CGPath {
        return path
    }
    
    public mutating func move(_ pt:CGPoint) -> CGPath? {
        return path
    }

}
