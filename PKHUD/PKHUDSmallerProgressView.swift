//
// Created by Eldis on 2019-06-26.
// Copyright (c) 2019 NSExceptional. All rights reserved.
//

import UIKit
import QuartzCore

fileprivate let animationKey = "progress"

/// PKHUDProgressView provides an indeterminate progress view.
open class PKHUDSmallerProgressView: PKHUDSmallerSquareBaseView, PKHUDAnimating {

    private lazy var progressLayer: CAShapeLayer = {
        let progressLayer = CAShapeLayer()
        progressLayer.frame = CGRect(x: 0.0, y: 0.0, width: 60, height: 60)
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.black.cgColor
        progressLayer.path = layoutPath(progressLayer.frame).cgPath
        progressLayer.lineWidth = 1
        self.layer.addSublayer(progressLayer)
        return progressLayer
    }()

    private func layoutPath(_ frame: CGRect) -> UIBezierPath {
        let path = UIBezierPath()
        path.addArc(
                withCenter: frame.center,
                radius: 20,
                startAngle: -0.5 * CGFloat.pi,
                endAngle: 1.5 * CGFloat.pi,
                clockwise: true)
        return path
    }

    public init(title: String? = nil, subtitle: String? = nil) {
        super.init()

        progressLayer.position = layer.position
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        progressLayer.position = layer.position
    }

    public func startAnimation() {
        let animation = PKHUDAnimation.circleProgressAnimation
        CATransaction.begin()
        progressLayer.add(animation, forKey: animationKey)
        CATransaction.commit()
    }

    public func stopAnimation() {
        progressLayer.removeAnimation(forKey: animationKey)
    }
}
