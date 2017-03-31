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

    weak var delegate: EffectDelegate?
    var effect: AKNode?

    

    override func viewDidLoad() {
        super.viewDidLoad()

        timeKnob.delegate = self
        feedbackKnob.delegate = self
        mixKnob.delegate = self        
    }

    func configureEffect(input: AKNode) -> AKNode? {
        effect = AKDelay(input)        

        propertyKnob(propertyKnob: timeKnob, didChange: timeKnob.value)
        propertyKnob(propertyKnob: feedbackKnob, didChange: feedbackKnob.value)
        propertyKnob(propertyKnob: mixKnob, didChange: mixKnob.value)

        print("Configuring delay");

        return effect
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

    @IBAction func onOffButtonTapped(_ sender: UIButton) {
        guard let delay = effect as? AKDelay else {
            return
        }

        delay.isStarted ? delay.stop() : delay.start()

        let imageName = delay.isStarted ? "push_button_active" : "push_button_inactive"
        sender.setImage(UIImage(named: imageName), for: .normal)

        delegate?.enable(enable: delay.isStarted, effect: effect)
    }

}

