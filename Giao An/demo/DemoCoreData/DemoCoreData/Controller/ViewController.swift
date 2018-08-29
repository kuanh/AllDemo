//
//  ViewController.swift
//  DemoCoreData
//
//  Created by KuAnh on 02/04/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var showImageStd: UIImageView!
    
    var imageUrl: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    var listStudents: Student? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        if let std = listStudents {
            guard let img: UIImage = UIImage(data: std.imageStd!) else { return }
            if let name = txtName, let age = txtAge, let photo = showImageStd {
                name.text = std.nameStd?.description
                age.text = std.ageStd.description
                photo.image = img
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectImage = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        showImageStd.image = selectImage
        dismiss(animated: true, completion: nil)
    }

    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let list = listStudents {
            list.nameStd = txtName.text
            list.ageStd = Int32(txtAge.text!)!
            list.imageStd = UIImageJPEGRepresentation(showImageStd.image!, 1)
        } else {
            let context = AppDelegate.share.persistenContainer.viewContext
            let std = Student(context: context)
            guard (txtAge.text?.isEmpty)! else { return }
            std.nameStd = txtName.text ?? ""
            std.ageStd = Int32(txtAge.text!)!
            std.imageStd = UIImageJPEGRepresentation(showImageStd.image!, 1)
        }
        AppDelegate.share.saveContext()
    }
    
}
