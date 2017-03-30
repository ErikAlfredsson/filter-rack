//
//  RackViewController.swift
//  EffectRack
//
//  Created by Erik Alfredsson on 2017-03-30.
//  Copyright © 2017 erikalfredsson. All rights reserved.
//

import UIKit

class RackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        for vc in childViewControllers {
            print(vc)
        }
    }

}
