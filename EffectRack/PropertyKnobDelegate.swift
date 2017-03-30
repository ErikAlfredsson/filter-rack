//
//  PropertyKnobDelegate.swift
//  EffectRack
//
//  Created by Erik Alfredsson on 2017-03-30.
//  Copyright © 2017 erikalfredsson. All rights reserved.
//

import Foundation

protocol PropertyKnobDelegate: class {

    func propertyKnob(propertyKnob: PropertyKnob, didChange value: CGFloat)

}
