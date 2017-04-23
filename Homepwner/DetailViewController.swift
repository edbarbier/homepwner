//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Edouard Barbier on 22/04/17.
//  Copyright © 2017 Edouard Barbier. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    //MARK: - @IBOUTLETS 
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var serialField: UITextField!
    @IBOutlet weak var valueField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    
    //MARK: - VARIABLES
    
    var item: Item! {
        didSet {
            
            navigationItem.title = item.name
        }
    }
    
    let numberFormatter: NumberFormatter = {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    let dateFormatter: DateFormatter = {
       
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    //MARK: - APP LIFE CYCLE 
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        serialField.text = item.serialNumber
        valueField.text = numberFormatter.string(from: NSNumber(value: item.valueInDollars))
        dateLabel.text = dateFormatter.string(from: item.dateCreated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
        
        //Save changes to item
        
        item.name = nameField.text ?? ""
        item.serialNumber = serialField.text
        
        if let valueText = valueField.text, let value = numberFormatter.number(from: valueText) {
            item.valueInDollars = value.intValue
        }
        
    }
    
    //MARK: - TEXTFIELD DELEGATE METHODS
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: - @IBACTIONS
    
    @IBAction func backgroundTapped(_ sender: Any) {
        view.endEditing(true)
    }
    


}
