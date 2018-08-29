//
//  ViewController.swift
//  DemoCoreDataInfoStudent
//
//  Created by KuAnh on 03/05/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var nameStd: UITextField!
    @IBOutlet weak var ageStd: UITextField!
    @IBOutlet weak var addressStd: UITextField!
    @IBOutlet weak var imageStd: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var student: InfoStudent? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        if let std = student {
            guard let image: UIImage = UIImage(data: std.imageStd!) else { return }
            nameStd.text = std.name?.description
            ageStd.text = "\(std.age)"
            addressStd.text = std.address?.description
            imageStd.image = image
        }
    }

    @IBAction func selectedImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        imageStd.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveStudent"{
            let name = nameStd.text
            let age = Int32(ageStd.text!)!
            let address = addressStd.text
            let imageStd = UIImageJPEGRepresentation(self.imageStd.image!, 1)
            
        }
    }
}

