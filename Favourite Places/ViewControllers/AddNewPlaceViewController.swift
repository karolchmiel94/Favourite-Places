//
//  AddNewPlaceViewController.swift
//  Favourite Places
//
//  Created by Karol Ch on 23/12/2017.
//  Copyright © 2017 Karol Chmiel. All rights reserved.
//

import UIKit

class AddNewPlaceViewController: UIViewController {

    @IBOutlet weak var placeImageUIView: UIView!
    @IBOutlet weak var placeImageUIViewHeight: NSLayoutConstraint!
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeImageUIViewHeight.constant = 0
        
    }
    
    override func viewWillLayoutSubviews() {
        //Change things here
        descriptionTextView.layer.borderColor = UIColor.gray.cgColor
        descriptionTextView.layer.cornerRadius = 15
        descriptionTextView.layer.borderWidth = 0.5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addPhotoButtonAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Favourite Places", message: "Would You like to add photo from Photos or take new one?", preferredStyle: .alert)
            
        let defaultAction = UIAlertAction(title: "Select from Photos", style: .default) { (alert: UIAlertAction!) -> Void in
            self.placeImageView.image = UIImage(named: "example_pic")
            self.placeImageUIViewHeight.constant = 180
//            self.selectPhotoFromLibrary()
        }
        let alternativeAction = UIAlertAction(title: "Take new photo", style: .default) { (alert: UIAlertAction!) -> Void in
            self.placeImageView.image = UIImage(named: "example_pic")
            self.placeImageUIViewHeight.constant = 180
//            self.takePicture()
        }
        alertController.addAction(defaultAction)
        alertController.addAction(alternativeAction)
            
        present(alertController, animated: true, completion: nil)
    }
    
    func selectPhotoFromLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.delegate = self
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func takePicture() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = UIImagePickerControllerSourceType.camera;
            imagePickerController.allowsEditing = false
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
}

extension AddNewPlaceViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.placeImageView.image = image
        placeImageUIViewHeight.constant = 220
        picker.dismiss(animated: true, completion: nil)
    }
}
