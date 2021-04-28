//
//  ViewController.swift
//  AnimatinoWithRandom
//
//  Created by Artem Bazhanov on 26.04.2021.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet var animatedView: SpringView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var curveLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var fromValueLabel: UILabel!
    @IBOutlet weak var toValueLabel: UILabel!
    @IBOutlet weak var autoreversesLabel: UILabel!
    @IBOutlet weak var repeatCountLabel: UILabel!
    @IBOutlet weak var initialVelocityLabel: UILabel!
    @IBOutlet weak var dampingLabel: UILabel!
    
    @IBOutlet weak var buttonRun: UIButton!
    
    let dataManager = DataManager.shared
    
    var animations: [Spring.AnimationPreset: Spring.AnimationCurve] = [:]
    
    var currentAnimation: Animation!
    var futureAnimation: Animation!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentAnimation = getRandomAnimation()
        futureAnimation = getRandomAnimation()
        buttonRun.setTitle(currentAnimation.name, for: .normal)
    }

    @IBAction func runPressed(_ sender: SpringButton) {
        setAnimationLabel(Value: currentAnimation)
        
        animatedView.animation = currentAnimation.name
        animatedView.curve = currentAnimation.curve
        animatedView.duration = CGFloat(currentAnimation.duration)
        animatedView.animate()
        
        buttonRun.setTitle(futureAnimation.name, for: .normal)
        
        currentAnimation = futureAnimation
        futureAnimation = getRandomAnimation()
    }
    
    private func getRandomAnimation() -> Animation {
        let name = dataManager.animations[Int.random(in: 0...dataManager.animations.count - 1)].rawValue
        let curve = dataManager.animationCurves[Int.random(in: 0...dataManager.animationCurves.count - 1)].rawValue
        
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
    
    private func setAnimationLabel(Value: Animation) {
        nameLabel.text = "Name: " + Value.name
        curveLabel.text = "Curve: " + Value.curve
        durationLabel.text = "Duration: " + String(Value.duration)
        fromValueLabel.text = "From value: " + String(Value.fromValue)
        toValueLabel.text = "To value: " + String(Value.toValue)
        autoreversesLabel.text = "Autoreverses: " + String(Value.autoreverses)
        repeatCountLabel.text = "Repeat count: " + String(Value.repeatCount)
        initialVelocityLabel.text = "Initial velocity: " + String(Value.initialVelocity)
        dampingLabel.text = "Damping: " + String(Value.damping)
    }
    
}

