//
//  CustomView.swift
//  Twitter Clone
//
//  Created by HackinTushar on 18/12/22.
//

import UIKit

@IBDesignable
class CustomView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if let context = UIGraphicsGetCurrentContext() {
            context.setStrokeColor(UIColor.white.cgColor)
            context.setLineWidth(1)
            context.move(to: CGPoint(x: 16, y: 10))
            context.addLine(to: CGPoint(x: 16, y: 10))
            context.strokePath()
        }
    }
}
