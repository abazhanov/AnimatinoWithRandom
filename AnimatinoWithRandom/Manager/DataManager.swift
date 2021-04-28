//
//  DataManager.swift
//  AnimatinoWithRandom
//
//  Created by Artem Bazhanov on 27.04.2021.
//

import Spring

class DataManager {
    
    static let shared = DataManager()
    
    let animations: [Spring.AnimationPreset] = [
        .Shake,
        .Pop,
        .Morph,
        .Squeeze,
        .Wobble,
        .Swing,
        .FlipX,
        .FlipY,
        .Fall,
        .SqueezeLeft,
        .SqueezeRight,
        .SqueezeDown,
        .SqueezeUp,
        .SlideLeft,
        .SlideRight,
        .SlideDown,
        .SlideUp,
        .FadeIn,
        .FadeOut,
        .FadeInLeft,
        .FadeInRight,
        .FadeInDown,
        .FadeInUp,
        .ZoomIn,
        .ZoomOut,
        .Flash
    ]

    let animationCurves: [Spring.AnimationCurve] = [
        .EaseIn,
        .EaseOut,
        .EaseInOut,
        .Linear,
        .Spring,
        .EaseInSine,
        .EaseOutSine,
        .EaseInOutSine,
        .EaseInQuad,
        .EaseOutQuad,
        .EaseInOutQuad,
        .EaseInCubic,
        .EaseOutCubic,
        .EaseInOutCubic,
        .EaseInQuart,
        .EaseOutQuart,
        .EaseInOutQuart,
        .EaseInQuint,
        .EaseOutQuint,
        .EaseInOutQuint,
        .EaseInExpo,
        .EaseOutExpo,
        .EaseInOutExpo,
        .EaseInCirc,
        .EaseOutCirc,
        .EaseInOutCirc,
        .EaseInBack,
        .EaseOutBack,
        .EaseInOutBack
    ]
    
    private init() {}
    
    func getRandomAnimation() -> Animation {
        let name = animations[Int.random(in: 0...animations.count - 1)].rawValue
        let curve = animationCurves[Int.random(in: 0...animationCurves.count - 1)].rawValue
        
        let duration = Float.random(in: 0...3)
        let fromValue = Float.random(in: 0...3)
        let toValue = Float.random(in: 0...3)
        let autoreverses: Bool = Int.random(in: 0...1) == 0 ? true : false
        let repeatCount = Float.random(in: 0...3)
        let initialVelocity = Float.random(in: 0...3)
        let damping = Float.random(in: 0...3)
        
        let animation = Animation(name: name, curve: curve, duration: duration, fromValue: fromValue, toValue: toValue, autoreverses: autoreverses, repeatCount: repeatCount, initialVelocity: initialVelocity, damping: damping)
        
        return animation
    }

}
