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
    private var lastTouchPoint = CGPoint.zero // last touch point
    private var anchor = CGPoint.zero // last anchor point
    private var length = 0 as CGFloat
    private var fEdge = true
    
    init() {
    }
    
    public mutating func start(_ pt:CGPoint) -> CGPath {
        // タッチしたとこに新しいサブパスの始点を作る
        path.move(to: pt)
        anchor = pt
        lastTouchPoint = pt
        length = 0.0
        return path
    }
    
    public mutating func move(_ newPoint:CGPoint) -> CGPath? {
        // ２点間の差
        let d = newPoint.delta(lastTouchPoint)
        
        // ２点間のベクトルの大きさ。
        length += sqrt(d.dotProduct(d))
    
        if !fEdge {
            let ptMid = anchor.middle(newPoint)
            path.addQuadCurve(to: newPoint, control: anchor)
            elements.append(SNQuadCurve(cpx: anchor.x, cpy: anchor.y, x: ptMid.x, y: ptMid.y))
            pathToReturn = path
        }
        delta = newPoint.delta(anchor)
        anchor = newPoint
        fEdge = false
        length = 0.0
        
        return path
    }

}
