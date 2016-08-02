//
//  ViewController.swift
//  ValidatedSignUp
//
//  Created by Flatiron School on 7/18/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var submit: UIButton!
    
    @IBAction func submitButtonTapped(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        self.firstName.delegate = self
        self.lastName.delegate = self
        self.email.delegate = self
        self.userName.delegate = self
        self.password.delegate = self
        
        super.viewDidLoad()
        
    }
    
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        return false
//    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print(textField)
    }
    
    func firstNameCheck() -> Bool {
        let digitCharacters = NSCharacterSet.decimalDigitCharacterSet().invertedSet
        if let name = self.firstName.text {
            if name.rangeOfCharacterFromSet(digitCharacters) != nil || name.characters.count < 1 {
                return false
            }
        }
        return false
    }
    
    func lastNameCheck() -> Bool {
        let digitCharacters = NSCharacterSet.decimalDigitCharacterSet().invertedSet
        if let name = self.lastName.text {
            if name.rangeOfCharacterFromSet(digitCharacters) != nil || name.characters.count < 1 {
                return false
            }

        }
        return true
    }
    
    func emailCheck() -> Bool {
        if let emailText = self.email.text {
            if emailText.characters.count < 1 || (emailText.characters.contains("@") && emailText.characters.contains(".")) {
                return true
            }
        }
        return false
    }
    
    func usernameCheck() -> Bool {
        let digitCharacters = NSCharacterSet.decimalDigitCharacterSet().invertedSet
        if let name = self.firstName.text {
            if name.rangeOfCharacterFromSet(digitCharacters) != nil || name.characters.count < 1 {
                return false
            }
        }
        return false
    }
    
    func passwordCheck() -> Bool {
        if let passwordText = self.password.text {
            if passwordText.characters.count < 6 {
                return true
            }
        }
        return false
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let alert = UIAlertController(title: "Incorrect Formatting", message: "The input we recieved was invalid.", preferredStyle: .Alert)
        switch textField {
        case textField  == self.firstName:
            if firstNameCheck() {
                textField.resignFirstResponder()
                self.lastName.enabled = true
                return true
            }
            
            alert.sh
//            alert.title = "Incorrect First Name"
//            alert.message = "The first name you entered was formatted incorrectly."
//            alert.addButtonWithTitle("Fix")
//            alert.show()
            return false
        case textField == self.lastName:
            if lastNameCheck() {
                textField.resignFirstResponder()
                self.email.enabled = true
                return true
            }
            alert.title = "Incorrect Last Name"
            alert.message = "The last name you entered was formatted incorrectly."
            alert.addButtonWithTitle("Fix")
            alert.show()
            return false
        case textField == self.email:
            if emailCheck() {
                textField.resignFirstResponder()
                self.userName.enabled = true
                return true
            }
            alert.title = "Incorrect Email Address"
            alert.message = "The email address you entered was formatted incorrectly."
            alert.addButtonWithTitle("Fix")
            alert.show()
            return false
        case textField ==  self.userName:
            if usernameCheck() {
                self.password.enabled = true
                textField.resignFirstResponder()
                return true
            }
            alert.title = "Incorrect Username"
            alert.message = "The username you entered was formatted incorrectly."
            alert.addButtonWithTitle("Fix")
            alert.show()
            return false
        case textField ==  self.password:
            if passwordCheck() {
                textField.resignFirstResponder()
                self.submit.enabled = true
                return true
            }
            alert.title = "Password Too Short"
            alert.message = "The password you entered was formatted incorrectly. Please make a longer password."
            alert.addButtonWithTitle("Fix")
            alert.show()
            return false
        default:
            return false
        }
    }
}

