//
//  SignUpViewController.swift
//  InterviewSignUp
//
//  Created by Liuyuan Tan on 2/26/16.
//  Copyright © 2016 Liuyuan "Todd" Tan. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let signUpView = SignUpView(frame: screenSize)
        self.view.addSubview(signUpView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
