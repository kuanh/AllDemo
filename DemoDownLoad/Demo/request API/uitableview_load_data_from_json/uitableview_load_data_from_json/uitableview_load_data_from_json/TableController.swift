//
//  TableController.swift
//  uitableview_load_data_from_json


import UIKit

class TableController: UITableViewController {

    
    var TableData:Array< String > = Array < String >()
    override func viewDidLoad() {
        super.viewDidLoad()
        get_data_from_url(url: "http://www.kaleidosblog.com/tutorial/tutorial.json")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = TableData[indexPath.row]
        return cell
    }
    
    
    func get_data_from_url(url:String)
    {
        let httpMethod = "GET"
        let timeout = 15
        let url = NSURL(string: url)
        let urlRequest = NSMutableURLRequest(URL: url,
            cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
            timeoutInterval: 15.0)
        let queue = OperationQueue()
        NSURLConnection.sendAsynchronousRequest(
            urlRequest,
            queue: queue,
            completionHandler: {(response: URLResponse,
                data: NSData!,
                error: NSError!) in
                if data.length > 0 && error == nil{
                    self.extract_json(data!)
                }else if data.length == 0 && error == nil{
                    println("Nothing was downloaded")
                } else if error != nil{
                    println("Error happened = \(error)")
                }
            }
        )
    }
    
    func extract_json(jsonData:NSString)
    {
        var parseError: NSError?
        
        let json: AnyObject? = JSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &parseError)
        if (parseError == nil)
        {
            if let countries_list = json as? NSArray
            {
                for i in 0 ..< countries_list.count
                {
                    if let country_obj = countries_list[i] as? NSDictionary
                    {
                        if let country_name = country_obj["country"] as? String
                        {
                            if let country_code = country_obj["code"] as? String
                            {
                                TableData.append(country_name + " [" + country_code + "]")
                            }
                        }
                    }
                }
            }
        }
        do_table_refresh();
    }
    
    
    func do_table_refresh()
    {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
            return
        })
    }

}
