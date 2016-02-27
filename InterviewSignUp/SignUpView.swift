//
//  SignUpView.swift
//  InterviewSignUp
//
//  Created by Liuyuan Tan on 2/26/16.
//  Copyright © 2016 Liuyuan "Todd" Tan. All rights reserved.
//

import UIKit

class SignUpView: UIView {
    
    var wingLabel = UILabel()
    var firstNameField = UITextField()
    var lastNameField = UITextField()
    var emailField = UITextField()
    var passwordField = UITextField()
    var signUpButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // The background
        self.backgroundColor = UIColor(red:0.08, green:0.14, blue:0.22, alpha:1.0)
        
        // The "Wing" label
        wingLabel = UILabel(frame: CGRectMake((frame.width * 0.35), (frame.height * 0.133), (frame.width * 0.3), (frame.height * 0.125)))
        wingLabel.text = "wing"
        wingLabel.textAlignment = NSTextAlignment.Center
        wingLabel.font = UIFont.systemFontOfSize(frame.width / 7)
        wingLabel.textColor = UIColor(red:0.0, green:0.69, blue:0.81, alpha:1.0)
        self.addSubview(wingLabel)
        
        // First name
        firstNameField = SignUpTextField(frame: CGRectMake((frame.width * 0.115), (frame.height * 0.433), (frame.width * 0.77), (frame.height * 0.061)), placeHolder: "First name", keyboardType: UIKeyboardType.Default, isSensitive: false)
        self.addSubview(firstNameField)
        
        // Last name
        lastNameField = SignUpTextField(frame: CGRectMake((frame.width * 0.115), (frame.height * 0.507), (frame.width * 0.77), (frame.height * 0.061)), placeHolder: "Last name", keyboardType: UIKeyboardType.Default, isSensitive: false)
        self.addSubview(lastNameField)
        
        // Email
        emailField = SignUpTextField(frame: CGRectMake((frame.width * 0.115), (frame.height * 0.585), (frame.width * 0.77), (frame.height * 0.061)), placeHolder: "Email", keyboardType: UIKeyboardType.EmailAddress, isSensitive: false)
        self.addSubview(emailField)
        
        // Password
        passwordField = SignUpTextField(frame: CGRectMake((frame.width * 0.115), (frame.height * 0.660), (frame.width * 0.77), (frame.height * 0.061)), placeHolder: "Password", keyboardType: UIKeyboardType.Default, isSensitive: true)
        self.addSubview(passwordField)
        
        // "SIGN UP" button
        signUpButton = UIButton(frame: CGRectMake((frame.width * 0.335), (frame.height * 0.841), (frame.width * 0.330), (frame.height * 0.121)))
        signUpButton.backgroundColor = UIColor(red:0.0, green:0.69, blue:0.81, alpha:1.0)
        signUpButton.setTitle("SIGN UP", forState: .Normal)
        signUpButton.setTitleColor(UIColor(red:0.08, green:0.14, blue:0.22, alpha:1.0), forState: .Normal)
        signUpButton.setTitleColor(UIColor(red:0.08, green:0.50, blue:0.70, alpha:1.0), forState: .Highlighted)
        signUpButton.layer.cornerRadius = signUpButton.frame.height / 2
        self.addSubview(signUpButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
