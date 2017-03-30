//
//  ViewController.swift
//  EffectRack
//
//  Created by Erik Alfredsson on 2017-03-29.
//  Copyright © 2017 erikalfredsson. All rights reserved.
//

import UIKit
import AudioKit

class ViewController: UIViewController, PropertyKnobDelegate {

    @IBOutlet weak var timeKnob: PropertyKnob!
    @IBOutlet weak var feedbackKnob: PropertyKnob!
    @IBOutlet weak var mixKnob: PropertyKnob!

    let mic = AKMicrophone()
    var delay: AKDelay?

    override func viewDidLoad() {
        super.viewDidLoad()

        timeKnob.delegate = self

        configureEffect()
        AudioKit.start()
    }

    func configureEffect() {
        delay = AKDelay(mic)
        delay?.time = 0.01 // seconds
        delay?.feedback  = 0.9 // Normalized Value 0 - 1
        delay?.dryWetMix = 0.6 // Normalized Value 0 - 1

        AudioKit.output = delay
    }

    func propertyKnob(propertyKnob: PropertyKnob, didChange value: CGFloat) {
        switch propertyKnob {
        case timeKnob:
            delay?.time = Double(value)
        case feedbackKnob:
            delay?.feedback = Double(value)
        case mixKnob:
            delay?.feedback = Double(value)
        default:
            return
        }
    }

}

