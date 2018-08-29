//
//  DetailViewController.swift
//  DemoSplitViewController
//
//  Created by KuAnh on 05/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit
import os.log

class DetailViewController: UIViewController {

    
    @IBOutlet weak var txtContent: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var content: MessageContent?
    
    var editContent: String?

    func configureView() {
        // Update the user interface for the detail item.
        if let ctn = content {
            self.txtContent.text = ctn.content
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = txtContent.text ?? ""
        content = MessageContent(content: name)
    }


}

