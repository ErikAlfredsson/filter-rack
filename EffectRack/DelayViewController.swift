//
//  ViewController.swift
//  EffectRack
//
//  Created by Erik Alfredsson on 2017-03-29.
//  Copyright © 2017 erikalfredsson. All rights reserved.
//

import UIKit
import AudioKit

class DelayViewController: UIViewController, PropertyKnobDelegate, EffectController {

    @IBOutlet weak var timeKnob: PropertyKnob!
    @IBOutlet weak var feedbackKnob: PropertyKnob!
    @IBOutlet weak var mixKnob: PropertyKnob!
    @IBOutlet weak var onOffButton: UIButton!

    var effect: AKNode?

    override func viewDidLoad() {
        super.viewDidLoad()

        timeKnob.delegate = self
        feedbackKnob.delegate = self
        mixKnob.delegate = self        
    }

    func initEffect(input: AKNode) -> AKNode? {
        effect = AKDelay(input)

        toggleState(enable: false)

        return effect
    }

    func propertyKnob(propertyKnob: PropertyKnob, didChange value: CGFloat) {
        guard let delay = effect as? AKDelay, delay.isStarted else {
            return
        }

        switch propertyKnob {
        case timeKnob:
            delay.time = Double(value)
        case feedbackKnob:
            delay.feedback = Double(value)
        case mixKnob:
            delay.dryWetMix = Double(value)
        default:
            return
        }
    }

    @IBAction func onOffButtonTapped(_ sender: UIButton) {
        guard let delay = effect as? AKDelay else {
            return
        }

        toggleState(enable: !delay.isStarted)
    }

    func toggleState(enable: Bool) {
        let imageName = enable ? "push_button_active" : "push_button_inactive"
        onOffButton.setImage(UIImage(named: imageName), for: .normal)

        if enable {
            propertyKnob(propertyKnob: timeKnob, didChange: timeKnob.value)
            propertyKnob(propertyKnob: feedbackKnob, didChange: feedbackKnob.value)
            propertyKnob(propertyKnob: mixKnob, didChange: mixKnob.value)

            (effect as! AKDelay).start()
        } else {
            (effect as! AKDelay).stop()
        }
    }

}

