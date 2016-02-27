//
//  SignUpInfo.swift
//  InterviewSignUp
//
//  Created by Liuyuan Tan on 2/26/16.
//  Copyright © 2016 Liuyuan "Todd" Tan. All rights reserved.
//

import UIKit

class SignUpInfo: NSObject {
    private var signUpInfo = [String: String]()

    init(firstName: String, lastName: String, email: String, password: String) {
        // Password needs to be salted and hashed for security
        let randomSalt = generateRandomSalt()
        let saltedPassword = randomSalt + password
        let hashedPassword = sha256(saltedPassword.dataUsingEncoding(NSUTF8StringEncoding)!)
        
        signUpInfo = [
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "hashedPassword": hashedPassword,
            "salt": randomSalt
        ]
    }
    
    func getInfo() -> [String: String]{
        return signUpInfo
    }
}

// SHA-256 encryption
func sha256(data : NSData) -> String {
    let res = NSMutableData(length: Int(CC_SHA256_DIGEST_LENGTH))
    CC_SHA256(data.bytes, CC_LONG(data.length), UnsafeMutablePointer(res!.mutableBytes))
    return "\(res!)".stringByReplacingOccurrencesOfString("", withString: "").stringByReplacingOccurrencesOfString(" ", withString: "")
}

// Random salt generator
func generateRandomSalt() -> String {
    let letters : NSString = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
    let randomString : NSMutableString = NSMutableString(capacity: 8)
    for _ in 1...8{
        let length = UInt32 (letters.length)
        let rand = arc4random_uniform(length)
        randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
    }
    return randomString as String
}