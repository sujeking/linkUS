//
//  MESessionManager.swift
//  linkUS
//
//  Created by  黎明 on 16/8/6.
//  Copyright © 2016年 sujeking. All rights reserved.
//

import UIKit

class MESessionManager: NSObject {
//    创建单利
    class var sharedInstance: MESessionManager {
        struct Static {
            static let instance : MESessionManager = MESessionManager()
        }
        return Static.instance
    }
}

