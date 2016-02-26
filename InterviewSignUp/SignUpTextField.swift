//
//  SignUpTextField.swift
//  InterviewSignUp
//
//  Created by Liuyuan Tan on 2/26/16.
//  Copyright © 2016 Liuyuan "Todd" Tan. All rights reserved.
//

import UIKit

class SignUpTextField: UITextField {
    
    init(frame: CGRect, placeHolder: String, keyboardType: UIKeyboardType, isSensitive: Bool) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        self.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        self.attributedPlaceholder = NSAttributedString(string: placeHolder,
            attributes:[NSForegroundColorAttributeName: UIColor(red:0.08, green:0.14, blue:0.22, alpha:1.0)])
        self.keyboardType = keyboardType
        self.secureTextEntry = isSensitive
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
