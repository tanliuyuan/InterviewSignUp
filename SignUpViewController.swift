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
        
        // Set up action when signUpButton is pressed
        signUpView.signUpButton.addTarget(self, action: "signUp:", forControlEvents: .TouchUpInside)
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

    func signUp(sender: UIButton) {
        // Dismiss the keyboard
        self.view.endEditing(true)
        // Parse the text inputs and wrap the data into JSON format
        if let firstName = signUpView.firstNameField.text {
            if firstName.isEmpty {
                showAlert("Error", withMessage: "Please enter your first name!")
                return
            }
            if let lastName = signUpView.lastNameField.text {
                if lastName.isEmpty {
                    showAlert("Error", withMessage: "Please enter your last name!")
                    return
                }
                if let email = signUpView.emailField.text {
                    let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
                    if !validate(emailRegEx, testString: email) {
                        showAlert("Error", withMessage: "Please enter a valid email address!")
                        return
                    }
                    if let password = signUpView.passwordField.text{
                        let passwordRegEx = "^(?=.*[\\d])(?=.*[a-z]).{6,18}$"
                        if !validate(passwordRegEx, testString: password) {
                            showAlert("Error", withMessage: "Please enter a valid password! A valid password has to be 6-18 characters long, with at least one digit and one letter.")
                            return
                        }
                        let signUpInfo = SignUpInfo(firstName: firstName, lastName: lastName, email: email, password: password).getInfo()
                        do {
                            let signUpInfoJSON = try NSJSONSerialization.dataWithJSONObject(signUpInfo, options: [])
                            if let signUpInfoJSONString = NSString(data: signUpInfoJSON, encoding: NSUTF8StringEncoding) {
                                // Check console for JSON string output.
                                print(signUpInfoJSONString)
                                showAlert("Congratulations", withMessage: "Sign up successful. Please check the XCode console output for JSON data.")
                                /***************************************************************************************/
                                /***** At this point, the JSON formatted data can be easily sent to an outside API *****/
                                /***************************************************************************************/
                                return
                            }
                        } catch let error as NSError {
                            print("JSON Serialization error: \(error.description)")
                            return
                        }
                    }
                }
            }
        }
        return
    }
    
    func validate(pattern: String, testString: String) -> Bool {
        let emailValidator = NSPredicate(format:"SELF MATCHES %@", pattern)
        return emailValidator.evaluateWithObject(testString)
    }
    
    func showAlert(withTitle: String, withMessage: String) {
        let alert = UIAlertController(title: withTitle, message: withMessage, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
