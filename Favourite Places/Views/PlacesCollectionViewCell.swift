//
//  PlaceCellCollectionViewCell.swift
//  Favourite Places
//
//  Created by Karol Ch on 23/12/2017.
//  Copyright © 2017 Karol Chmiel. All rights reserved.
//

import UIKit

class PlacesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundUIView: UIView!
    @IBOutlet weak var cellView: RoundedUIViewFrames!
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var placeTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundUIView.layer.cornerRadius = 20
        backgroundUIView.layer.masksToBounds = true
        cellView.layer.cornerRadius = 20
        cellView.layer.masksToBounds = true
    }
}
