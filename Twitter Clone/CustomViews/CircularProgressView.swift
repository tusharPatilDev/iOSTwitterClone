//
//  CircularProgressView.swift
//  Twitter Clone
//
//  Created by HackinTushar on 03/03/23.
//

import UIKit

class CircularProgressView: UIView {
    private var progressLayer = CAShapeLayer()
    private var startPoint = CGFloat(-Double.pi / 2)
    private var endPoint = CGFloat(3 * Double.pi / 2)
    let progressColor = UIColor.systemBlue
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        createCircularPath()
    }
    func createCircularPath() {
        // created circularPath for circleLayer and progressLayer
        
        let circularPath = CAShapeLayer()
        circularPath.path = UIBezierPath(roundedRect: CGRect(x: 15, y: 5, width: 30, height: 30), cornerRadius: 20).cgPath
        circularPath.fillColor = UIColor.clear.cgColor
        circularPath.strokeColor = UIColor.systemGray5.cgColor
        circularPath.lineWidth = 4
        layer.addSublayer(circularPath)
        progressLayer.path = circularPath.path
        progressLayer.fillColor = UIColor.clear.cgColor
        
        progressLayer.lineWidth = 4
        progressLayer.lineCap = .round
        progressLayer.strokeEnd = 0
        layer.addSublayer(progressLayer)
    }
    func setProgress(progress:Double){
        DispatchQueue.main.async {
            if progress == 1.0{
                self.progressLayer.strokeColor = UIColor.red.cgColor
            } else if progress > 0.75{
                self.progressLayer.strokeColor = UIColor.systemOrange.cgColor
            } else {
                self.progressLayer.strokeColor = self.progressColor.cgColor
            }
            self.progressLayer.strokeEnd = CGFloat(progress)
        }
    }
    private func progressAnimation(duration: TimeInterval) {
        // created circularProgressAnimation with keyPath
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        // set the end time
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = 1.0
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
}
