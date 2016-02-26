//
//  SignUpView.swift
//  InterviewSignUp
//
//  Created by Liuyuan Tan on 2/26/16.
//  Copyright © 2016 Liuyuan "Todd" Tan. All rights reserved.
//

import UIKit

class SignUpView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // The background
        self.backgroundColor = UIColor(red:0.08, green:0.14, blue:0.22, alpha:1.0)
        
        // The "Wing" label
        let wingLabel = UILabel(frame: CGRectMake((frame.width * 0.35), (frame.height * 0.133), (frame.width * 0.3), (frame.height * 0.125)))
        wingLabel.text = "wing"
        wingLabel.textAlignment = NSTextAlignment.Center
        wingLabel.font = UIFont.systemFontOfSize(frame.width / 7)
        wingLabel.textColor = UIColor(red:0.0, green:0.69, blue:0.81, alpha:1.0)
        self.addSubview(wingLabel)
        
        // First name
        let firstNameField = UITextField(frame: CGRectMake((frame.width * 0.115), (frame.height * 0.433), (frame.width * 0.77), (frame.height * 0.061)))
        firstNameField.backgroundColor = UIColor.whiteColor()
        firstNameField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        firstNameField.attributedPlaceholder = NSAttributedString(string:"First name",
            attributes:[NSForegroundColorAttributeName: UIColor(red:0.08, green:0.14, blue:0.22, alpha:1.0)])
        self.addSubview(firstNameField)
        
        // Last name
        let lastNameField = UITextField(frame: CGRectMake((frame.width * 0.115), (frame.height * 0.507), (frame.width * 0.77), (frame.height * 0.061)))
        lastNameField.backgroundColor = UIColor.whiteColor()
        lastNameField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        lastNameField.attributedPlaceholder = NSAttributedString(string:"Last name",
            attributes:[NSForegroundColorAttributeName: UIColor(red:0.08, green:0.14, blue:0.22, alpha:1.0)])
        self.addSubview(lastNameField)
        
        // Email
        let emailField = UITextField(frame: CGRectMake((frame.width * 0.115), (frame.height * 0.585), (frame.width * 0.77), (frame.height * 0.061)))
        emailField.backgroundColor = UIColor.whiteColor()
        emailField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        emailField.attributedPlaceholder = NSAttributedString(string:"Email",
            attributes:[NSForegroundColorAttributeName: UIColor(red:0.08, green:0.14, blue:0.22, alpha:1.0)])
        self.addSubview(emailField)
        
        // Password
        let passwordField = UITextField(frame: CGRectMake((frame.width * 0.115), (frame.height * 0.660), (frame.width * 0.77), (frame.height * 0.061)))
        passwordField.backgroundColor = UIColor.whiteColor()
        passwordField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        passwordField.attributedPlaceholder = NSAttributedString(string:"Password",
            attributes:[NSForegroundColorAttributeName: UIColor(red:0.08, green:0.14, blue:0.22, alpha:1.0)])
        self.addSubview(passwordField)
        
        // "SIGN UP" button
        let signUpButton = UIButton(frame: CGRectMake((frame.width * 0.335), (frame.height * 0.841), (frame.width * 0.330), (frame.height * 0.121)))
        signUpButton.backgroundColor = UIColor(red:0.0, green:0.69, blue:0.81, alpha:1.0)
        signUpButton.setTitle("SIGN UP", forState: .Normal)
        signUpButton.setTitleColor(UIColor(red:0.08, green:0.14, blue:0.22, alpha:1.0), forState: .Normal)
        signUpButton.layer.cornerRadius = signUpButton.frame.height / 2
        self.addSubview(signUpButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
