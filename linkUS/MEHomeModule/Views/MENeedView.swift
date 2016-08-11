//
//  MEServiceView.swift
//  linkUS
//
//  Created by sujeking on 16/8/10.
//  Copyright © 2016年 sujeking. All rights reserved.
//

import UIKit

class MENeedView: UIView,UITableViewDataSource {
    
    var tableview: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.tableview = UITableView(frame: self.bounds)
        self.tableview.dataSource = self
        self.addSubview(self.tableview)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let ides: String! = "ides"
        
        var cell = tableview.dequeueReusableCellWithIdentifier(ides)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: ides)
        }
        
        cell?.textLabel?.text = "need \(indexPath.row)"
        return cell!
    }
    
}
