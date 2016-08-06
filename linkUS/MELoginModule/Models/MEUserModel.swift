//
//  MEUserModel.swift
//  linkUS
//
//  Created by sujeking on 16/8/5.
//  Copyright © 2016年 sujeking. All rights reserved.
//

import UIKit

class MEUserModel: NSObject {
    
    var userName : String?
    var userToken : String?
    var userPassWord : String?
    
    class func xxxx(dict : NSDictionary)-> MEUserModel{
        let model = MEUserModel()
        model.setValuesForKeysWithDictionary(dict as! [String : AnyObject])
        return model
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    
}
