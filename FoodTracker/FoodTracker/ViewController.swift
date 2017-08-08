//
//  ViewController.swift
//  FoodTracker
//
//  Created by Brosteau on 8/08/17.
//  Copyright © 2017 Brosteau Alexandre. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var mealNameLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Hide keyboard
        
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //When the text field has been edited, we set the text label with the value
        mealNameLabel.text = textField.text
    }
    
    //MARK: Actions
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        
        mealNameLabel.text = "Default text"
        
    }
    
}

