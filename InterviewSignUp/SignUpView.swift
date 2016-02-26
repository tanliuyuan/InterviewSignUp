//
//  SignUpView.swift
//  InterviewSignUp
//
//  Created by Liuyuan Tan on 2/26/16.
//  Copyright © 2016 Liuyuan "Todd" Tan. All rights reserved.
//

import UIKit

class SignUpView: UIView {

    //let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // The general view and background
        let signUpView = UIView(frame: frame)
        signUpView.backgroundColor = UIColor(red:0.08, green:0.14, blue:0.22, alpha:1.0)
        self.addSubview(signUpView)
        
        // The "Wing" label
        let wingLabel = UILabel(frame: CGRectMake((frame.width * 0.35), (frame.height * 0.133), (frame.width * 0.3), (frame.height * 0.125)))
        wingLabel.text = "wing"
        wingLabel.textAlignment = NSTextAlignment.Center
        wingLabel.font = UIFont.systemFontOfSize(frame.width / 7)
        wingLabel.textColor = UIColor(red:0.0, green:0.69, blue:0.81, alpha:1.0)
        self.addSubview(wingLabel)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
