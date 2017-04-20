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
    
    //MARK: - TABLE VIEW DELEGATE METHODS
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        let item = itemStore.allItems[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
    }
}
