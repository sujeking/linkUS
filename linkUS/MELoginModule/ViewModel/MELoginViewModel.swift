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
    }
    
    class func loginAction(userName: String, passWord:String, superViewController: MELoginViewController) {
        
        let msgViewController = MEHomeViewController(nibName: "MEHomeViewController", bundle: nil)
        superViewController.presentViewController(msgViewController, animated: false, completion: nil)
        UIApplication.sharedApplication().keyWindow?.layer.addAnimation(self.commitTranstion(), forKey: nil)
    }
    
    class func commitTranstion()-> CATransition {
        
        let transition = CATransition()
        
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromBottom
        
        return transition
    }
    
    
}
