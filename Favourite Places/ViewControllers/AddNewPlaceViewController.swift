//
//  AddNewPlaceViewController.swift
//  Favourite Places
//
//  Created by Karol Ch on 23/12/2017.
//  Copyright © 2017 Karol Chmiel. All rights reserved.
//

import UIKit
import CoreData

class AddNewPlaceViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var placeImageUIView: UIView!
    @IBOutlet weak var placeImageUIViewHeight: NSLayoutConstraint!
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var places: [NSManagedObject] = []
    
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
    
    @IBAction func savePlaceAction(_ sender: Any) {
        
        if placeImageView.image != nil && !titleTextField.text!.isEmpty && !descriptionTextView.text!.isEmpty{
            guard let title = titleTextField.text,
                let image = UIImagePNGRepresentation(placeImageView.image!),
                let desc = descriptionTextView.text
                else {
                    return
            }
            print("Gitara siema")
            let place = PlaceModel.init(with: title, image, and: desc)
            savePlace(with: place)
        } else {
            return
        }
    }
    
    func savePlace(with data: PlaceModel) {
        print("Saving data with title :\(data.title)\nand description :\(data.description)")
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Place", in: managedContext)!
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        person.setValue(data.title, forKey: "title")
        person.setValue(data.description, forKey: "desc")
        person.setValue(data.image, forKey: "image")
        do {
            try managedContext.save()
            self.navigationController?.popViewController(animated: true)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
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
