//
//  SignUpViewController.swift
//  InterviewSignUp
//
//  Created by Liuyuan Tan on 2/26/16.
//  Copyright © 2016 Liuyuan "Todd" Tan. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate{
    
    let signUpView = SignUpView(frame: UIScreen.mainScreen().bounds)
    var keyboardHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add signUpView
        self.view.addSubview(signUpView)
        
        // Set the delegate of all textfields to the controller itself
        signUpView.firstNameField.delegate = self
        signUpView.lastNameField.delegate = self
        signUpView.emailField.delegate = self
        signUpView.passwordField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    // Add observers for keyboard events
    override func viewWillAppear(animated:Bool) {
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    // Move the view to make room for keyboard
    func keyboardWillShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize =  (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue() {
                if keyboardHeight != keyboardSize.height {
                    if keyboardHeight != nil {
                        self.moveTextField(Float(keyboardHeight) - Float(keyboardSize.height))
                    } else {
                        self.moveTextField(-Float(keyboardSize.height))
                    }
                    keyboardHeight = keyboardSize.height
                }
            }
        }
    }
    
    // Move the view back when keyboard is dismissed
    func keyboardWillHide(notification: NSNotification) {
        self.moveTextField(Float(keyboardHeight))
        keyboardHeight = CGFloat()
    }
    
    // Remove observers for keyboard events
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    // Dismiss keyboard when return key is hit
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Dismiss keyboard when user touches empty spaces
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func moveTextField(movement: Float) {
        UIView.animateWithDuration(0.3, animations: {
            self.view.frame = CGRectOffset(self.view.frame, 0, CGFloat(movement))
        })
    }


}
