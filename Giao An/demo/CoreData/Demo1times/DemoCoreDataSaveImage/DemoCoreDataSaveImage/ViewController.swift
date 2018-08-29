//
//  ViewController.swift
//  DemoCoreDataSaveImage
//
//  Created by KuAnh on 09/12/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imgEmp: UIImageView!
    @IBOutlet weak var txtId: UITextField!
    @IBOutlet weak var txtName: UITextField!
    
    var imageUrl: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var listEmployees: Employee? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        if let list = listEmployees {
            guard let url = URL(string: String(describing: list.imageEmp)) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            let image: UIImage = UIImage(data: data)!
            if let id = txtId, let name = txtName, let photo = imgEmp {
                id.text = list.idEmp?.description
                name.text = list.nameEmp?.description
                photo.image = image
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        imgEmp.image = selectedImage
        picker.dismiss(animated: true, completion: nil)
    }
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
//        if let list = listEmployees {
//
//        } else {
            let context = AppDelegate.shared.persistentContainer.viewContext
            let newEmployee = Employee(context: context)
            newEmployee.idEmp = txtId.text
            newEmployee.nameEmp = txtName.text
//        newEmployee.imageEmp = UIImageJPEGRepresentation(imgEmp.image!, 1)
        AppDelegate.shared.saveContext()
//        }
    }
    
}

