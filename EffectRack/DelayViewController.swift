//
//  ViewController.swift
//  EffectRack
//
//  Created by Erik Alfredsson on 2017-03-29.
//  Copyright © 2017 erikalfredsson. All rights reserved.
//

import UIKit
import AudioKit

class DelayViewController: EffectViewController, PropertyKnobDelegate {

    @IBOutlet weak var timeKnob: PropertyKnob!
    @IBOutlet weak var feedbackKnob: PropertyKnob!
    @IBOutlet weak var mixKnob: PropertyKnob!

    let mic = AKMicrophone()

    override func viewDidLoad() {
        super.viewDidLoad()

        timeKnob.delegate = self
        feedbackKnob.delegate = self
        mixKnob.delegate = self

        configureEffect()
        AudioKit.start()
    }

    func configureEffect() {
        effect = AKDelay(mic)

        guard let delay = effect as? AKDelay else {
            return
        }

        delay.time = 0.01
        delay.feedback  = 0.9
        delay.dryWetMix = 0.6

        timeKnob.value = CGFloat(delay.time)
        feedbackKnob.value = CGFloat(delay.feedback)
        mixKnob.value = CGFloat(delay.dryWetMix)

        AudioKit.output = effect
    }

    func propertyKnob(propertyKnob: PropertyKnob, didChange value: CGFloat) {
        guard let delay = effect as? AKDelay else {
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

}

