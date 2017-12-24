//
//  PlaceViewController.swift
//  Favourite Places
//
//  Created by Karol Ch on 23/12/2017.
//  Copyright © 2017 Karol Chmiel. All rights reserved.
//

import UIKit
import CoreData

class PlaceViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var mainView: UIView!
    var places: [NSManagedObject] = []
    var place = PlaceModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = place.title
        descriptionLabel.text = place.description
    }

    override func viewWillLayoutSubviews() {
        mainView.layer.borderColor = UIColor.gray.cgColor
        mainView.layer.borderWidth = 0.5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
