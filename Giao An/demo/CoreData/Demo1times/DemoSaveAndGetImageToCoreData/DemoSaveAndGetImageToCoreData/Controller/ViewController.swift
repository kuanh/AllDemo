//
//  ViewController.swift
//  DemoSaveAndGetImageToCoreData
//
//  Created by KuAnh on 11/12/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var txtId: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var photoStd: UIImageView!
    
    
    var listStudent: Student? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        if let list = listStudent {
            if let id = txtId, let name = txtName, let age = txtAge, let image = photoStd {
                id.text = list.idStd?.description
                name.text = list.nameStd?.description
                age.text = "\(list.age)"
                guard let imageStd = list.imgStd else {return}
                image.image = UIImage(data: imageStd)
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
        photoStd.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let id = txtId, let name = txtName, let age = Int32(txtAge.text!), let image = photoStd else { fatalError("error")}
            if let list = listStudent {
                list.idStd = id.text
                list.nameStd = name.text
                list.age = age
                list.imgStd = UIImageJPEGRepresentation(image.image!, 1)
            }
            
        
        
    }


}

