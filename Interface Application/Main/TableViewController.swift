//
//  ApplicationTableViewController.swift
//  Interface Application
//
//  Created by Леонид Лукашевич on 12.09.2020.
//  Copyright © 2020 Hutr0. All rights reserved.
//

import UIKit

class ApplicationTableViewController: UITableViewController {
    
    let appDescArray: Array<Array<String>> = [["Таблица с эмодзи", "Таблица с полностью настраиваемыми ячейками."],
                                              ["Фотокарточки", "Таблица с ячейками, которые можно открыть и передать картинку."]]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func unwindSegueToStart(_ sender: UIStoryboardSegue) {
        guard sender.identifier == "unwindToStart" else { return }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppCell", for: indexPath) as! ApplicationTableViewCell

        // Configure the cell...
        cell.Name.text = appDescArray[indexPath.item][0]
        cell.Description.text = appDescArray[indexPath.item][1]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            performSegue(withIdentifier: "firstApp", sender: nil)
        } else if indexPath.item == 1 {
            performSegue(withIdentifier: "secondApp", sender: nil)
        }
    }
    
}
