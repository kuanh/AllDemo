//
//  ViewController.swift
//  DemoCoreData
//
//  Created by KuAnh on 30/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtId: UITextField!
    @IBOutlet weak var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func configureView() {
        if let list = listStudents {
            if let id = txtId, let name = txtName {
                id.text = list.idStd?.description
                name.text = list.name?.description
            }
        }
    }
    
    var listStudents: Students? {
        didSet {
            configureView()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let id = txtId, let name = txtName {
            let context = AppDelegate.shared.persistentContainer.viewContext
            let newStudent = Students(context: context)
            if let list = listStudents {
                list.idStd = id.text
                list.name = name.text
            } else {
                newStudent.idStd = id.text
                newStudent.name = name.text
            }
            do {
                try context.save()
            }catch let error as NSError {
                fatalError("\(error), \(error.userInfo)")
            }
            
        }
    }


}

