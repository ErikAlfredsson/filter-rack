//
//  NibInstatiator.swift
//  EffectRack
//
//  Created by Erik Alfredsson on 2017-03-30.
//  Copyright © 2017 erikalfredsson. All rights reserved.
//

import UIKit

@IBDesignable class NibInstatiator: UIView {

    @IBInspectable var nibName: String!


    override func awakeFromNib() {
        super.awakeFromNib()

        let view = loadNib()

        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        addSubview(view)
    }

    func loadNib() -> UIView {
        let nib = UINib(nibName: nibName, bundle: Bundle.main)
        return nib.instantiate(withOwner: self, options: nil)[0] as! UIView
    }

}
