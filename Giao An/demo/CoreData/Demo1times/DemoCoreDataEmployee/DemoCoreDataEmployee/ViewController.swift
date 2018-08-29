//
//  ViewController.swift
//  DemoCoreDataEmployee
//
//  Created by KuAnh on 09/12/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var selectedPhoto: UIImageView!
    @IBOutlet weak var txtIdEmp: UITextField!
    @IBOutlet weak var txtNameEmp: UITextField!
    
    var imgUrl: String = ""
    
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
            if let id = txtIdEmp, let name = txtNameEmp, let photo = selectedPhoto {
                id.text = list.idEmp?.description
                name.text = list.nameEmp?.description
                photo.image = image
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let assetUrl = info[UIImagePickerControllerPHAsset] as? PHAsset {
            
        }
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        selectedPhoto.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func employeeImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let list = listEmployees {
            
        } else {
            let context = AppDelegate.share.persistentContainer.viewContext
            let newEmployee = Employee(context: context)
            newEmployee.idEmp = txtIdEmp.text
            newEmployee.nameEmp = txtNameEmp.text
            newEmployee.imageEmp = imgUrl
        }
    }


}

