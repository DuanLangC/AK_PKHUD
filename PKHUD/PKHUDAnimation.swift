//
//  PKHUDAnimation.swift
//  PKHUD
//
//  Created by Piergiuseppe Longo on 06/01/16.
//  Copyright © 2016 Piergiuseppe Longo, NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import Foundation
import QuartzCore

public final class PKHUDAnimation {

    public static let discreteRotation: CAAnimation = {
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        animation.values = [
            NSNumber(value: 0.0),
            NSNumber(value: 1.0 * .pi / 6.0),
            NSNumber(value: 2.0 * .pi / 6.0),
            NSNumber(value: 3.0 * .pi / 6.0),
            NSNumber(value: 4.0 * .pi / 6.0),
            NSNumber(value: 5.0 * .pi / 6.0),
            NSNumber(value: 6.0 * .pi / 6.0),
            NSNumber(value: 7.0 * .pi / 6.0),
            NSNumber(value: 8.0 * .pi / 6.0),
            NSNumber(value: 9.0 * .pi / 6.0),
            NSNumber(value: 10.0 * .pi / 6.0),
            NSNumber(value: 11.0 * .pi / 6.0),
            NSNumber(value: 2.0 * .pi)
        ]
        animation.keyTimes = [
            NSNumber(value: 0.0),
            NSNumber(value: 1.0 / 12.0),
            NSNumber(value: 2.0 / 12.0),
            NSNumber(value: 3.0 / 12.0),
            NSNumber(value: 4.0 / 12.0),
            NSNumber(value: 5.0 / 12.0),
            NSNumber(value: 0.5),
            NSNumber(value: 7.0 / 12.0),
            NSNumber(value: 8.0 / 12.0),
            NSNumber(value: 9.0 / 12.0),
            NSNumber(value: 10.0 / 12.0),
            NSNumber(value: 11.0 / 12.0),
            NSNumber(value: 1.0)
        ]
        animation.duration = 1.2

        #if swift(>=4.2)
        animation.calculationMode = .discrete
        #else
        animation.calculationMode = "discrete"
        #endif

        animation.repeatCount = Float(INT_MAX)
        return animation
    }()

    static let continuousRotation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = 2.0 * .pi
        animation.duration = 1.2
        animation.repeatCount = Float(INT_MAX)
        return animation
    }()

    static let circleProgressAnimation: CAAnimationGroup = {
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
}
