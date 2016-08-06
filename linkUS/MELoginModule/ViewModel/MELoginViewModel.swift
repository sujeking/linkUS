//
//  MELoginViewModel.swift
//  linkUS
//
//  Created by sujeking on 16/8/5.
//  Copyright © 2016年 sujeking. All rights reserved.
//

import UIKit
import Foundation


class MELoginViewModel: NSObject {
    
    class func checkFullUserNameAndPassword(userNameString: String, passWordString: String) -> Bool {
        if userNameString.characters.count > 0
            && passWordString.characters.count > 0 {
            return true
        }
        return false
        
    }}
