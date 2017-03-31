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

    weak var delegate: EffectDelegate?
    var effect: AKNode?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func configureEffect(input: AKNode) -> AKNode? {
        return effect
    }

    func propertyKnob(propertyKnob: PropertyKnob, didChange value: CGFloat) {

    }

}
