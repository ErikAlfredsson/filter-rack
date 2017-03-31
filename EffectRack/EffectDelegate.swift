//
//  EffectDelegate.swift
//  EffectRack
//
//  Created by Erik Alfredsson on 2017-03-31.
//  Copyright © 2017 erikalfredsson. All rights reserved.
//

import Foundation
import AudioKit

protocol EffectDelegate: class {

    func enable(enable: Bool, effect: AKNode?)

}
