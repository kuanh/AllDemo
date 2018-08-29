//
//  ViewController.swift
//  DemoCoreDataAlertView
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
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func saveItem(_ sender: Any) {
        guard let enteredTextId = txtId.text else {return}
        guard let enteredTextName = txtName.text else { return }
        if (enteredTextId.isEmpty || enteredTextName.isEmpty) {
            let alert = UIAlertController(title: "Please type someThing", message: "Your entry was left blank.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default) { action in
                
            })
            self.present(alert, animated: true, completion: nil)
        } else {
            guard let entryTextId = txtId.text else { return }
            guard let entryTextName = txtName.text else { return }
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let newItem = Item(context: context)
            newItem.id = entryTextId
            newItem.name = entryTextName
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            dismiss(animated: true, completion: nil)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

