//
//  ViewController.swift
//  Core Skills
//
//  Created by Andrew Clark (RIT Student) on 1/22/19.
//  Copyright © 2019 Andrew Clark. All rights reserved.
//

import UIKit

// UITextFieldDelegate is used for handling text field events, I think it's a subclass of UIViewC
class ViewController: UIViewController, UITextFieldDelegate {
    
    // Command + K for showing on-screen keyboard
    // Connected variables
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        label.text = "Hello from code!"
        // Prompts keyboard for textfield
        textField.becomeFirstResponder()
        // The object its going to handle the event
        textField.delegate = self
        
    }
    
    
    // Connected action from the button - checks if it was tapped, if so change text and resign
    @IBAction func buttonWasTapped(_ sender: Any) {
        
        label.text = "Hello \(textField.text!)"
        // Removes keyboard as first responder from textfield
        textField.resignFirstResponder()
        
    }
    
    // Touched elsewhere - resign
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
    }

    // Return button clicked - resign all, don't line break
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }

}

