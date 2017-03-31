//
//  RackViewController.swift
//  EffectRack
//
//  Created by Erik Alfredsson on 2017-03-30.
//  Copyright © 2017 erikalfredsson. All rights reserved.
//

import UIKit
import AudioKit

class RackViewController: UIViewController, EffectDelegate {

    let mic = AKMicrophone()
    var lastOutput: AKNode?

    override func viewDidLoad() {
        super.viewDidLoad()

        lastOutput = mic

        for vc in childViewControllers {
            guard let effectViewController = vc as? EffectController else {
                return
            }

            effectViewController.delegate = self

            guard lastOutput != nil else {
                print("No input for next effect in chain...")
                break
            }

            guard let newOutput = effectViewController.configureEffect(input: lastOutput!) else {
                print("No output from effect...")
                break
            }

            lastOutput = newOutput
        }

        AudioKit.output = lastOutput
        AudioKit.start()
    }

    func enable(enable: Bool, effect: AKNode?) {
        
    }

}
