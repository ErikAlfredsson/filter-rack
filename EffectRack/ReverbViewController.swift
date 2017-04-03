//
//  ReverbViewController.swift
//  EffectRack
//
//  Created by Erik Alfredsson on 2017-03-30.
//  Copyright © 2017 erikalfredsson. All rights reserved.
//

import UIKit
import AudioKit

class ReverbViewController: UIViewController, PropertyKnobDelegate, EffectController {

    @IBOutlet weak var mixKnob: PropertyKnob!
    @IBOutlet weak var onOffButton: UIButton!

    var effect: AKNode?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mixKnob.delegate = self
    }

    func initEffect(input: AKNode) -> AKNode? {
        effect = AKReverb(input)

        toggleState(enable: false)

        return effect
    }

    func propertyKnob(propertyKnob: PropertyKnob, didChange value: CGFloat) {
        guard let reverb = effect as? AKReverb, reverb.isStarted else {
            return
        }
        reverb.dryWetMix = Double(value)
    }

    @IBAction func onOffButtonTapped(_ sender: UIButton) {
        guard let reverb = effect as? AKReverb else {
            return
        }

        toggleState(enable: !reverb.isStarted)
    }

    func toggleState(enable: Bool) {
        let imageName = enable ? "push_button_active" : "push_button_inactive"
        onOffButton.setImage(UIImage(named: imageName), for: .normal)

        if enable {
            (effect as! AKReverb).start()
            
            propertyKnob(propertyKnob: mixKnob, didChange: mixKnob.value)
        } else {
            (effect as! AKReverb).stop()
        }
    }

}
