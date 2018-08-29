//
//  ViewController.swift
//  DemoCoreDataArray
//
//  Created by KuAnh on 04/12/2017.
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
    
    func configureView() {
        if let list = listStudents {
            if let id = txtId, let name = txtName {
                id.text = list.idStd?.description
                name.text = list.name?.description
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var listStudents: Students? {
        didSet{
            configureView()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? StudentTableViewController {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let newStudent = Students(context: context)
            newStudent.idStd = txtId.text
            newStudent.name = txtName.text
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
    }
    


}

