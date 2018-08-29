//
//  MasterViewController.swift
//  zoomingImageViewSplit
//
//  Created by KuAnh on 07/11/2017.
//  Copyright © 2017 KuAnh. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()
    
    var listPhotos = [ListPhoto]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.listPhotos.append(ListPhoto(name: "Hoang Anh", photo: PhotoLibrary.img1))
        self.listPhotos.append(ListPhoto(name: "Thai", photo: PhotoLibrary.img2))
        self.listPhotos.append(ListPhoto(name: "Cuong Ngo", photo: PhotoLibrary.img3))
        self.listPhotos.append(ListPhoto(name: "Hao", photo: PhotoLibrary.img4))
        self.listPhotos.append(ListPhoto(name: "Dat oc", photo: PhotoLibrary.img5))
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers.last as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc
    func insertNewObject(_ sender: Any) {
        let indexPath = IndexPath(row: listPhotos.count, section: 0)
        let photoInfo = ListPhoto(name: "aaa", photo: PhotoLibrary.img1)
        listPhotos.append(photoInfo)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                let listPhoto: ListPhoto?
                listPhoto = listPhotos[indexPath.row]
                controller.listPhoto = listPhoto
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPhotos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let photo = listPhotos[indexPath.row]
        cell.textLabel!.text = photo.name
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            listPhotos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

