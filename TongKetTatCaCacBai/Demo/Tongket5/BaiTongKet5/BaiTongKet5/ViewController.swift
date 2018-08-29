//
//  ViewController.swift
//  BaiTongKet5
//
//  Created by KuAnh on 03/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtYear: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var selectImageView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var student: Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtName.delegate = self
        txtYear.delegate = self
        txtAddress.delegate = self
        if let student = student {
            txtName.text = student.name
            txtYear.text = "\(student.year)"
            txtAddress.text = student.address
            selectImageView.image = student.photo
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSavebuttonState()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("\(info)")
        }
        
        selectImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
        } else {
            print("Hello")
        }
    }
    @IBAction func selectedimageFromLibraryPhoto(_ sender: UITapGestureRecognizer) {
        txtName.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = txtName.text ?? ""
        guard let year = Int(txtYear.text ?? "") else { return }
        let address = txtAddress.text ?? ""
        guard let photo = selectImageView.image else { return }
        student = Student(name: name, year: year, address: address, photo: photo)
    }
    
    func updateSavebuttonState() {
        let text = txtName.text ?? ""
        let year = txtYear.text ?? ""
        let address = txtAddress.text ?? ""
        saveButton.isEnabled = !text.isEmpty
        saveButton.isEnabled = !year.isEmpty
        saveButton.isEnabled = !address.isEmpty
    }

}

