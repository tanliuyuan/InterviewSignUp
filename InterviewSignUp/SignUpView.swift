//
//  SignUpView.swift
//  InterviewSignUp
//
//  Created by Liuyuan Tan on 2/26/16.
//  Copyright © 2016 Liuyuan "Todd" Tan. All rights reserved.
//

import UIKit

class SignUpView: UIView {

    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // The general view and background
        let signUpView = UIView(frame: screenSize)
        signUpView.backgroundColor = UIColor(red:0.08, green:0.14, blue:0.22, alpha:1.0)
        addSubview(signUpView)
        
        // The "Wing" label
        let wingLabel = UILabel(frame: CGRectMake(227, 177, 297, 169))
        wingLabel.text = "Wing"
        wingLabel.font = UIFont.systemFontOfSize(144)
        wingLabel.textColor = UIColor(red:0.0, green:0.69, blue:0.81, alpha:1.0)
        addSubview(wingLabel)
    }


}
