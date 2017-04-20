//
//  ItemCell.swift
//  Homepwner
//
//  Created by Edouard Barbier on 20/04/17.
//  Copyright © 2017 Edouard Barbier. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumberLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.adjustsFontForContentSizeCategory = true
        serialNumberLabel.adjustsFontForContentSizeCategory = true
        valueLabel.adjustsFontForContentSizeCategory = true
        
    }
    
    func config(item: Item) {
        
        if let name = item.name as String? {
            
            nameLabel.text = name
        }
        
        if let serialNumber = item.serialNumber as String? {
            
            serialNumberLabel.text = serialNumber
        }
        
        if let value = item.valueInDollars as Int? {
            
            if value > 50 {
                
                valueLabel.textColor = UIColor.green
                
            } else {
                
                valueLabel.textColor = UIColor.red
            }
            
            valueLabel.text = "$\(value)"
        }
        
    }
    
    
        
}
