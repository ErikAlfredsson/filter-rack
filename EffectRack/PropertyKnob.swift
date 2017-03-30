//
//  PropertyKnob.swift
//  EffectRack
//
//  Created by Erik Alfredsson on 2017-03-30.
//  Copyright © 2017 erikalfredsson. All rights reserved.
//

import UIKit

class PropertyKnob: UIView {

    @IBOutlet weak var rotaryKnob: MHRotaryKnob!
    @IBOutlet weak var label: UILabel!

    weak var delegate: PropertyKnobDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()

        rotaryKnob.interactionStyle = MHRotaryKnobInteractionStyle.rotating
        rotaryKnob.scalingFactor = 1
        rotaryKnob.minimumValue = 0
        rotaryKnob.maximumValue = 1
        rotaryKnob.maxAngle = 135
        rotaryKnob.value = 0.5
        rotaryKnob.defaultValue = 0.5
        rotaryKnob.continuous = true
        rotaryKnob.backgroundColor = UIColor.clear
        rotaryKnob.setKnobImage(UIImage(named: "knob"), for: .normal)
        rotaryKnob.addTarget(self, action: #selector(rotaryKnobDidChange), for: UIControlEvents.valueChanged)
    }

    func rotaryKnobDidChange() {
        delegate?.propertyKnob(propertyKnob: self, didChange: rotaryKnob.value)
    }
}
