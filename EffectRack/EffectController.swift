//
//  EffectController.swift
//  EffectRack
//
//  Created by Erik Alfredsson on 2017-03-31.
//  Copyright © 2017 erikalfredsson. All rights reserved.
//

import Foundation
import AudioKit

protocol EffectController: class {

    weak var delegate: EffectDelegate? {get set}
    var effect: AKNode? {get set}

    func configureEffect(input: AKNode) -> AKNode?

}
