//
//  PKHUDProgressVIew.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/12/15.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit
import QuartzCore

fileprivate let animationKey = "progress"

/// PKHUDProgressView provides an indeterminate progress view.
open class PKHUDProgressView: PKHUDSquareBaseView, PKHUDAnimating {

    var lineWidth: CGFloat = 2 {
        didSet {
            progressLayer.lineWidth = lineWidth
        }
    }

    var radius: CGFloat? = nil {
        didSet {
            progressLayer.path = layoutPath(progressLayer.bounds).cgPath
        }
    }

    private lazy var progressLayer: CAShapeLayer = {
        let progressLayer = CAShapeLayer()
        progressLayer.frame = CGRect(x: 0.0, y: 0.0, width: 88.0, height: 88.0)
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.black.cgColor
        progressLayer.path = layoutPath(progressLayer.frame).cgPath
        progressLayer.lineWidth = lineWidth
        self.layer.addSublayer(progressLayer)
        return progressLayer
    }()

    private lazy var animation: CAAnimationGroup = {
        let a1 = CABasicAnimation(keyPath: "strokeEnd")
        a1.duration = 1
        a1.isRemovedOnCompletion = false
        a1.fillMode = .forwards
        a1.fromValue = 0
        a1.toValue = 1
        a1.timingFunction = CAMediaTimingFunction(name: .easeIn)

        let a2 = CABasicAnimation(keyPath: "strokeStart")
        a2.duration = 1
        a2.isRemovedOnCompletion = false
        a2.fillMode = .forwards
        a2.fromValue = 0
        a2.toValue = 1
        a2.beginTime = 1
        a2.timingFunction = CAMediaTimingFunction(name: .easeOut)

        let group = CAAnimationGroup()
        group.animations = [a1, a2]
        group.duration = 2
        group.repeatCount = Float.greatestFiniteMagnitude

        return group
    }()

    private func layoutPath(_ frame: CGRect) -> UIBezierPath {
        let path = UIBezierPath()
        path.addArc(
                withCenter: frame.center,
                radius: radius ?? (frame.midX * 0.9),
                startAngle: -0.5 * CGFloat.pi,
                endAngle: 1.5 * CGFloat.pi,
                clockwise: true)
        return path
    }

    public init(title: String? = nil, subtitle: String? = nil) {
        super.init(image: nil, title: title, subtitle: subtitle)

        progressLayer.position = layer.position
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        progressLayer.position = layer.position
    }
    
    public func startAnimation() {
        CATransaction.begin()
        progressLayer.add(animation, forKey: animationKey)
        CATransaction.commit()
    }

    public func stopAnimation() {
        progressLayer.removeAnimation(forKey: animationKey)
    }
}

