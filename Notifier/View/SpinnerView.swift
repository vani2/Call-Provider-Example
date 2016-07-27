//
//  SpinnerView.swift
//  Call Provider
//
//  Created by Ivan Vavilov on 7/13/16.
//  Copyright © 2016 Ivan Vavilov. All rights reserved.
//

import UIKit
import Foundation

private struct Colors {
    static let sunYellow = UIColor(red: 1, green: 224/255.0, blue: 44/255.0, alpha: 1)
    static let sunRed = UIColor(red: 244/255.0, green: 67/255.0, blue: 54/255.0, alpha: 1)
    static let inactive = UIColor(red: 13/255.0, green: 94/255.0, blue: 79/255.0, alpha: 1)
}


class SpinnerView: UIView {

    let progressLayer = CAShapeLayer()
    let fillLayer = CAShapeLayer()
    
    var endValue: CGFloat = 0 {
        didSet {
            animateStroke()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupFillLayer()
        setupLayer()
        setupShadowLayer()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updatePath()
    }
    
    private func setupLayer() {
        progressLayer.position = CGPoint.zero
        progressLayer.lineWidth = 4
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = 0.01
        progressLayer.fillColor = nil
        progressLayer.strokeColor = Colors.sunYellow.cgColor
        
        progressLayer.shadowRadius = 2
        
        layer.addSublayer(progressLayer)
    }
    
    private func setupFillLayer() {
        fillLayer.position = CGPoint.zero
        fillLayer.lineWidth = 4
        fillLayer.strokeStart = 0
        fillLayer.strokeEnd = 1
        fillLayer.fillColor = nil
        fillLayer.strokeColor = Colors.inactive.cgColor
    
        layer.addSublayer(fillLayer)
    }
    
    private func setupShadowLayer() {
        
    }
    
    private func updatePath() {
        let radius = CGFloat(bounds.height / 2) - progressLayer.lineWidth
        let startAngle = CGFloat(-M_PI / 2)
        let endAngle = CGFloat(3 * M_PI / 2)
        let modelCenter = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let path = UIBezierPath(arcCenter: modelCenter,
                                radius: radius,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true).cgPath
        
        progressLayer.path = path
        fillLayer.path = path
        fillLayer.shadowPath = path
    }
    
    private func animateStroke() {
        if endValue > 0 {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 0
            animation.toValue = endValue
            animation.duration = Double(endValue)
            animation.isRemovedOnCompletion = false
            animation.fillMode = kCAFillModeForwards
            
            progressLayer.add(animation, forKey: nil)
            
            if endValue < 0.4 {
                progressLayer.strokeColor = Colors.sunRed.cgColor
            }
            progressLayer.shadowColor = progressLayer.strokeColor
            
            let shadowAnimation = CABasicAnimation(keyPath: "shadowOpacity")
            shadowAnimation.fromValue = 0
            shadowAnimation.toValue = 1
            shadowAnimation.duration = Double(endValue)
            shadowAnimation.autoreverses = true
            shadowAnimation.fillMode = kCAFillModeBackwards
            
            progressLayer.add(shadowAnimation, forKey: nil)
        }
    }
}
