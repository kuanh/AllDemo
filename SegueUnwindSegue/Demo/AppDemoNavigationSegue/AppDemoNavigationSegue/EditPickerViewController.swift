//
//  EditPickerViewController.swift
//  AppDemoNavigationSegue
//
//  Created by KuAnh on 07/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class EditPickerViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var txtHeight: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtJob: UITextField!
    @IBOutlet weak var txtJobPosition: UITextField!
    @IBOutlet weak var txtUniversity: UITextField!
    
    var listOfHeight = [Int](130...200)
    var listOfAddress = ["Ha Noi", "Da Nang", "Ho Chi Minh", "Ha Giang", "Dien Bien"]
    var listOfJob = ["Cong An", "CNTT", "Sinh Vien", "Chua Di Lam", "Khac"]
    var listOfUniversity = ["Dai Hoc Fpt", "Hoc Vien Cong An", "Dai Hoc Quoc Gia", "Dai Hoc Bach Khoa"]
    
    let my_PickerView = UIPickerView()
    
    var current_arr: [String] = []
    
    var active_textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtHeight.delegate = self
        txtAddress.delegate = self
        txtJob.delegate = self
        txtUniversity.delegate = self
        
        my_PickerView.delegate = self
        my_PickerView.dataSource = self
        
        txtHeight.inputView = my_PickerView 
        txtAddress.inputView = my_PickerView
        txtJob.inputView = my_PickerView
        txtUniversity.inputView = my_PickerView
        
        create_toolbar()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        active_textField = textField
        var listStringOfHeight: [String] = []
        for i in listOfHeight {
            listStringOfHeight.append("\(i)")
        }
        switch textField {
        case txtHeight:
            current_arr = listStringOfHeight
        case txtAddress:
            current_arr = listOfAddress
        case txtJob:
            current_arr = listOfJob
        case txtUniversity:
            current_arr = listOfUniversity
        default:
            print("Default")
        }
        
        my_PickerView.reloadAllComponents()
        return true
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("\(info)")
        }
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectImageToPhotoLibraryFromImageView(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
    
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return current_arr.count
        }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return current_arr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("'Selected item is", current_arr[row])
        active_textField.text = current_arr[row]
    }
    
    func create_toolbar() {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
        toolbar.setItems([doneButton, spaceButton, cancelButton], animated: false)
        txtHeight.inputAccessoryView = toolbar
        txtAddress.inputAccessoryView = toolbar
        txtJob.inputAccessoryView = toolbar
        txtUniversity.inputAccessoryView = toolbar
    }
    
    @objc func doneClick() {
        active_textField.resignFirstResponder()
    }
    
    @objc func cancelClick() {
        active_textField.text = ""
        active_textField.resignFirstResponder()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddInfo" {
            
        }
    }
 

}
