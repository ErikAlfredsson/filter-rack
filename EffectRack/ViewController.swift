//
//  ViewController.swift
//  EffectRack
//
//  Created by Erik Alfredsson on 2017-03-29.
//  Copyright © 2017 erikalfredsson. All rights reserved.
//

import UIKit
import AudioKit

class ViewController: UIViewController {

    let mic = AKMicrophone()
    var delay: AKDelay?

    override func viewDidLoad() {
        super.viewDidLoad()

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

    @IBAction func timeSliderValueChanged(sender: UISlider) {
        delay?.time = Double(sender.value)
    }

    @IBAction func feedbackSliderValueChanged(sender: UISlider) {
        delay?.feedback = Double(sender.value)
    }

    @IBAction func mixSliderValueChanged(sender: UISlider) {
        delay?.dryWetMix = Double(sender.value)
    }

}

