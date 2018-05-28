//
//  UDrawView.swift
//  UDraw
//
//  Created by Seiya Ugajin on 2018/05/27.
//  Copyright © 2018年 Seiya Ugajin. All rights reserved.
//

import UIKit


public protocol UDrawViewDelegate:class {
    func didComplete(_ elements:[UPathElement]) -> Bool
}

open class UDrawView: UIView {
    public var builder = UPathBuilder()
    weak public var delegate:UDrawViewDelegate?
    public lazy var shapeLayer:CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        shapeLayer.contentsScale = UIScreen.main.scale
        shapeLayer.lineWidth = 10.0
        shapeLayer.strokeColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).cgColor
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shapeLayer)
        return shapeLayer
    }()
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            shapeLayer.path = builder.start(touch.location(in: self))
        }
    }
    
    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if let path = builder.move(touch.location(in: self)) {
                shapeLayer.path = path
            }
        }
    }
}
