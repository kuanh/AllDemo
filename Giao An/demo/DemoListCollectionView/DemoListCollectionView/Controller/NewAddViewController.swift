//
//  NewAddViewController.swift
//  DemoListCollectionView
//
//  Created by KuAnh on 12/03/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import UIKit

class NewAddViewController: UIViewController {
    
    @IBOutlet weak var selectDayPickerView: UIPickerView!
    var arrayTime = [Int](1...150)
    var looping = 40

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension NewAddViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayTime.count * looping
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(arrayTime[row % arrayTime.count])"
    }
    
}
