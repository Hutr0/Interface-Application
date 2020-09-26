//
//  FirstAppController.swift
//  Interface Application
//
//  Created by Леонид Лукашевич on 18.09.2020.
//  Copyright © 2020 Hutr0. All rights reserved.
//

import UIKit

class FirstAppController: UITableViewController {
    
    var objects: Array<Emoji> = [
        Emoji(emoji: "🥰", name: "Love", description: "Let's loveeach other"),
        Emoji(emoji: "☀️", name: "Sunny", description: "My lovely girl"),
        Emoji(emoji: "🐱", name: "Cat", description: "Cat is a cutest animal"),
        Emoji(emoji: "⚽️", name: "Football", description: "Let's play football together")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.title = "Emoji Reader"
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveSegue" else { return }
        
        let sourceVC = segue.source as! FirstAddController
        let emoji = sourceVC.emoji
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            objects[selectedIndexPath.row] = emoji
            tableView.reloadRows(at: [selectedIndexPath], with: .fade)
        } else {
            let newIndexPath = IndexPath(row: objects.count, section: 0)
            objects.append(emoji)
            tableView.insertRows(at: [newIndexPath], with: .fade)
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "editSegue" else { return }
        
        let indexPath = tableView.indexPathForSelectedRow!
        let emoji = objects[indexPath.row]
        
        let navigationVC = segue.destination as! UINavigationController
        let firstAddVC = navigationVC.topViewController as! FirstAddController
        
        firstAddVC.emoji = emoji
        firstAddVC.title = "Edit"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath) as! FirstAppCell

        // Configure the cell...
        cell.set(object: objects[indexPath.item])
        
        return cell
    }

    //: Реализация удаления строк
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    //: Реализация перетаскивания строк
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

        let movedObject = objects.remove(at: fromIndexPath.row)
        objects.insert(movedObject, at: to.row)
        tableView.reloadData()
    }

    //: Реаизация фукции "swipe"
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let done = doneAction(at: indexPath)
        let favourite = favouriteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [done, favourite])
    }
    
    func doneAction(at indexPath: IndexPath) -> UIContextualAction {
        
        let action = UIContextualAction(style: .destructive, title: "Done") { (action, view, completion) in
            
            self.objects.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            completion(true)
        }
        
        action.backgroundColor = UIColor.green
        action.image = UIImage(systemName: "checkmark.circle")
        
        return action
    }
    
    func favouriteAction(at indexPath: IndexPath) -> UIContextualAction {
        
        var object = objects[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Favourite") { (action, view, completion) in
            
            object.isFavourite = !object.isFavourite
            self.objects[indexPath.row] = object
            completion(true)
        }
        
        let isFavourite = object.isFavourite
        let color: UIColor = isFavourite ? .systemPurple : .gray
        let image: String = isFavourite ? "heart.fill" : "heart"
        
        action.backgroundColor = color
        action.image = UIImage(systemName: image)
        
        return action
    }

}
