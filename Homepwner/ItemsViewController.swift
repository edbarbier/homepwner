//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Edouard Barbier on 20/04/17.
//  Copyright © 2017 Edouard Barbier. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    //MARK: - VARIABLES
    
    var itemStore: ItemStore!
    
    //MARK: - APP LIFE CYCLE 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
    }
    
    //MARK: - TABLE VIEW DELEGATE METHODS
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let item = itemStore.allItems[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
    }
    
    //MARK: - @IBACTIONS 
    
    @IBAction func addNewItem(_ sender: UIButton) {
        
        
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        
        if isEditing {
            
            sender.setTitle("Edit", for: .normal)
            setEditing(false, animated: true)
        } else {
            
            sender.setTitle("Done", for: .normal)
            setEditing(true, animated: true)
        }
    }
}
