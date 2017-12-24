//
//  Place.swift
//  Favourite Places
//
//  Created by Karol Ch on 22/12/2017.
//  Copyright © 2017 Karol Chmiel. All rights reserved.
//

import UIKit

class PlaceModel {

    var title: String
    var image: Data
    var description: String
    
    init() {
        title = ""
        image = Data()
        description = ""
    }

    init(with title: String, _ photo: Data, and description: String) {
        self.title = title
        self.image = photo
        self.description = description
    }
}
