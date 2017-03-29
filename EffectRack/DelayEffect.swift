//
//  DelayEffect.swift
//  EffectRack
//
//  Created by Erik Alfredsson on 2017-03-29.
//  Copyright © 2017 erikalfredsson. All rights reserved.
//

import Foundation
import AudioKit

class DelayEffect {

    public let output: AKNode?

    init(node: AKNode?) {
        let delay = AKDelay(node)
        delay.time = 0.01 // seconds
        delay.feedback  = 0.9 // Normalized Value 0 - 1
        delay.dryWetMix = 0.6 // Normalized Value 0 - 1

        output = delay
    }

}
