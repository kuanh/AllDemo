//
//  EditViewController.swift
//  AppDemoNavigationSegue
//
//  Created by KuAnh on 07/10/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit
import CoreData

class EditViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var goBack: UIBarButtonItem!
    @IBOutlet weak var pickerViewHeight: UIPickerView!
    @IBOutlet weak var pickerViewAddress: UIPickerView!
    @IBOutlet weak var pickerViewJob: UIPickerView!
    @IBOutlet weak var txtJobPosition: UITextField!
    @IBOutlet weak var pickerViewUniversity: UIPickerView!
    
    var listOfHeight = [Int](130...200)
    var listOfAddress = ["Ha Noi", "Da Nang", "Ho Chi Minh", "Ha Giang", "Dien Bien"]
    var listOfJob = ["Cong An", "CNTT", "Sinh Vien", "Chua Di Lam", "Khac"]
    var listOfUniversity = ["Dai Hoc Fpt", "Hoc Vien Cong An", "Dai Hoc Quoc Gia", "Dai Hoc Bach Khoa"]
    
    var txtHeight: String?
    var txtAddress: String?
    var txtJob: String?
    var txtUnversity: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerViewHeight.tag = 1
        pickerViewAddress.tag = 2
        pickerViewJob.tag = 3
        pickerViewUniversity.tag = 4
        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    

    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerViewHeight == pickerView {
            return listOfHeight.count
        }else if pickerViewAddress == pickerView {
            return listOfAddress.count
        } else if pickerViewJob == pickerView {
            return listOfJob.count
        } else if pickerViewUniversity == pickerView {
            return listOfUniversity.count
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerViewHeight == pickerView {
            return "\(listOfHeight[row])"
        }else if pickerViewAddress == pickerView {
            return listOfAddress[row]
        } else if pickerViewJob == pickerView {
            return listOfJob[row]
        } else if pickerViewUniversity == pickerView {
            return listOfUniversity[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtHeight = "\(listOfHeight[row])"
        txtAddress = listOfAddress[row]
        txtJob = listOfJob[row]
        txtUnversity = listOfUniversity[row]
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditInfo" {
            
        }
    }
    

}
