//
//  ViewController.swift
//  DemoThemSuaXoa
//
//  Created by KuAnh on 28/03/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var showImage: UIImageView!
    
    var student: Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtName.delegate = self
        
        if let std = student {
            txtName.text = std.name
            txtAge.text = "\(std.age)"
            showImage.image = std.photo
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtName.resignFirstResponder()
        return true
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectImage = info[UIImagePickerControllerOriginalImage] as? UIImage else { fatalError("error") }
        
        showImage.image = selectImage
        
        dismiss(animated: true, completion: nil)
    }

    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        txtName.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveStudent" {
            let name = txtName.text ?? ""
            guard let age = Int(txtAge.text ?? "") else { return }
            guard let photo = showImage.image else { return }
            
            student = Student(name: name, age: age, photo: photo)
        }
    }
}

