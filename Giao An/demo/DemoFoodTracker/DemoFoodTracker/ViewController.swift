//
//  ViewController.swift
//  DemoFoodTracker
//
//  Created by KuAnh on 28/03/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.delegate = self
        if let meal = meal {
            navigationItem.title = meal.name
            name.text = meal.name
            age.text = "\(meal.age)"
            selectedImage.image = meal.photo
        }
        updateSaveButtonState()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        updateSaveButtonState()
        navigationItem.title = name.text
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImg = info[UIImagePickerControllerOriginalImage] as? UIImage else { fatalError("K thay url") }
        selectedImage.image = selectedImg
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        let imgPickerController = UIImagePickerController()
        imgPickerController.sourceType = .photoLibrary
        imgPickerController.delegate = self
        present(imgPickerController, animated: true, completion: nil)
    }
    
    func updateSaveButtonState() {
        let text = name.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }

}

