//
//  ViewController.swift
//  JSONDemo
//
//  Created by TheAppGuruz-New-6 on 31/07/14.
//  Copyright (c) 2014 TheAppGuruz-New-6. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    let yourJsonFormat: String = "JSONFile" // set text JSONFile : json data from file
                                            // set text JSONUrl : json data from web url
    
    var arrDict :NSMutableArray=[]
    
    @IBOutlet weak var tvJSON: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if yourJsonFormat == "JSONFile" {
            jsonParsingFromFile()
        } else {
            jsonParsingFromURL()
        }
    }
    
    func jsonParsingFromURL () {
        let url = NSURL(string: "http://theappguruz.in//Apps/iOS/Temp/json.php")
        let request = URLRequest(url: url! as URL)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) {(response, data, error) in
            self.startParsing(data: data! as NSData)
        }
    }
    
    func jsonParsingFromFile()
    {
        let path: NSString = Bundle.main.path(forResource: "days", ofType: "json")! as NSString
        let data : NSData = try! NSData(contentsOfFile: path as String, options: NSData.ReadingOptions.dataReadingMapped)
        
        self.startParsing(data: data)
    }
    
    func startParsing(data :NSData)
    {
        let dict: NSDictionary!=(try! JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
        
        for i in 0 ..< (dict.value(forKey: "MONDAY") as! NSArray).count
        {
            arrDict.add((dict.value(forKey: "MONDAY") as! NSArray) .object(at: i))
        }
        for i in 0 ..< (dict.value(forKey: "TUESDAY") as! NSArray).count
        {
            arrDict.add((dict.value(forKey: "TUESDAY") as! NSArray) .object(at: i))
        }
        for i in 0 ..< (dict.value(forKey: "WEDNESDAY") as! NSArray).count
        {
            arrDict.add((dict.value(forKey: "WEDNESDAY") as! NSArray) .object(at: i))
        }
        tvJSON .reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        let strTitle : NSString = (arrDict[indexPath.row] as AnyObject).value(forKey: "TITLE") as! NSString
        let strDescription : NSString = (arrDict[indexPath.row] as AnyObject).value(forKey: "DETAILS") as! NSString
        cell.lblTitle.text = strTitle as String
        cell.lbDetails.text = strDescription as String
        return cell as TableViewCell
    }
}
