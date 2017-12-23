//
//  Place.swift
//  Favourite Places
//
//  Created by Karol Ch on 22/12/2017.
//  Copyright © 2017 Karol Chmiel. All rights reserved.
//

import UIKit

class Place {

    var title: String
    var image: UIImage
    var description: String

    init(with title: String, and description: String) {
        self.title = title
        self.image = UIImage.init()
        self.description = description
    }
}
