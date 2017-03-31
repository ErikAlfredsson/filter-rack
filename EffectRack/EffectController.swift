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

    var effect: AKNode? {get set}

    func initEffect(input: AKNode) -> AKNode?
    func toggleState(enable: Bool)

}
