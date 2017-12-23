//
//  RoundedUIViewFrames.swift
//  Favourite Places
//
//  Created by Karol Ch on 23/12/2017.
//  Copyright © 2017 Karol Chmiel. All rights reserved.
//

import UIKit

class RoundedUIViewFrames: UIView {
        
    override func layoutSubviews() { setup() }
        
    func setup() {
        let r: CGFloat = 5
        let path = UIBezierPath(roundedRect: self.bounds, cornerRadius:r)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }

}
