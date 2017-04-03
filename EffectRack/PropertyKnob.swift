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

    var value: CGFloat = 0 {
        didSet {
            rotaryKnob.value = value
        }
    }

    weak var delegate: PropertyKnobDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()

        rotaryKnob.interactionStyle = MHRotaryKnobInteractionStyle.sliderVertical
        rotaryKnob.scalingFactor = 1
        rotaryKnob.minimumValue = 0
        rotaryKnob.maximumValue = 1
        rotaryKnob.maxAngle = 135
        rotaryKnob.value = 0
        rotaryKnob.defaultValue = 0
        rotaryKnob.continuous = true
        rotaryKnob.backgroundColor = UIColor.clear
        rotaryKnob.setKnobImage(UIImage(named: "knob"), for: .normal)
        rotaryKnob.addTarget(self, action: #selector(rotaryKnobDidChange), for: UIControlEvents.valueChanged)
    }

    func rotaryKnobDidChange() {
        value = rotaryKnob.value
        delegate?.propertyKnob(propertyKnob: self, didChange: rotaryKnob.value)
    }
}
