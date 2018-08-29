//
//  ViewController.swift
//  DemoCoreDataItem
//
//  Created by KuAnh on 04/12/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtId: UITextField!
    @IBOutlet weak var txtName: UITextField!
    
    var listItems: Item? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        if let list = listItems {
            if let id = txtId, let name = txtName {
                id.text = list.id?.description
                name.text = list.name?.description
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
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let name = txtName.text else { return }
        guard let id = txtId.text else { return }

        if let list = listItems {
            list.id = id
            list.name = name
        } else {
            let context = AppDelegate.shared.persistentContainer.viewContext
            let newitem = Item(context: context)
            newitem.id = id
            newitem.name = name
        }
        AppDelegate.shared.saveContext()
    }
    
}

