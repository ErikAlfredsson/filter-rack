//
//  BitCrusherViewController.swift
//  EffectRack
//
//  Created by Erik Alfredsson on 2017-03-31.
//  Copyright © 2017 erikalfredsson. All rights reserved.
//

import UIKit
import AudioKit

class BitCrusherViewController: UIViewController, PropertyKnobDelegate, EffectController {

    @IBOutlet weak var bitDepthKnob: PropertyKnob!
    @IBOutlet weak var sampleRateKnob: PropertyKnob!
    @IBOutlet weak var onOffButton: UIButton!

    var effect: AKNode?

    override func viewDidLoad() {
        super.viewDidLoad()

        bitDepthKnob.delegate = self
        sampleRateKnob.delegate = self
    }

    func initEffect(input: AKNode) -> AKNode? {
        effect = AKBitCrusher(input)

        toggleState(enable: false)

        return effect
    }

    func propertyKnob(propertyKnob: PropertyKnob, didChange value: CGFloat) {
        guard let bitCrusher = effect as? AKBitCrusher, bitCrusher.isStarted else {
            return
        }

        switch propertyKnob {
        case bitDepthKnob:
            bitCrusher.bitDepth = Double(value * 24)
        case sampleRateKnob:
            bitCrusher.sampleRate = Double(value * 44000)
        default:
            return
        }
    }

    @IBAction func onOffButtonTapped(_ sender: UIButton) {
        guard let bitCrusher = effect as? AKBitCrusher else {
            return
        }

        toggleState(enable: !bitCrusher.isStarted)
    }

    func toggleState(enable: Bool) {
        let imageName = enable ? "push_button_active" : "push_button_inactive"
        onOffButton.setImage(UIImage(named: imageName), for: .normal)

        if enable {
            (effect as! AKBitCrusher).start()
            
            propertyKnob(propertyKnob: bitDepthKnob, didChange: bitDepthKnob.value)
            propertyKnob(propertyKnob: sampleRateKnob, didChange: sampleRateKnob.value)
        } else {
            (effect as! AKBitCrusher).stop()
        }
    }

}
