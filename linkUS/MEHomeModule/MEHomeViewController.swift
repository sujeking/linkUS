//
//  MEMsgViewController.swift
//  linkUS
//
//  Created by  黎明 on 16/8/6.
//  Copyright © 2016年 sujeking. All rights reserved.
//

import UIKit

let headViewHeight: CGFloat = 244.0
let sessionViewHeight: CGFloat = 44.0


class MEHomeViewController: UIViewController,UITableViewDelegate,UIScrollViewDelegate {

    var headView:UIView!
    var sessionView:UIView!
    var scrollView:UIScrollView!
    var serviceview: MEServiceView!
    var needview: MENeedView!
    var headViewCenterY: CGFloat!
    
//    MARK: lefe
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSubViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    MARK: init
    
    func setupSubViews() {

        self.addScrollView()
        self.addHeadView()
        self.addSessionView()
    }
    
    func addHeadView() {
        self.headView = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: headViewHeight))
        self.headView.backgroundColor = UIColor.brownColor()
        self.headViewCenterY = self.headView.center.y
        self.view.addSubview(self.headView)
    
    }

    func addSessionView() {
        self.sessionView = UIView(frame: CGRect(x: 0, y: headViewHeight - sessionViewHeight,
            width: CGRectGetWidth(UIScreen.mainScreen().bounds), height: sessionViewHeight))
        self.sessionView.backgroundColor = UIColor.redColor()
        self.headView.addSubview(self.sessionView)
    }
    
    func addScrollView() {
        self.scrollView = UIScrollView(frame: CGRect(x: 0, y: 0,
            width: CGRectGetWidth(UIScreen.mainScreen().bounds),
            height: CGRectGetHeight(UIScreen.mainScreen().bounds)))
        self.scrollView.contentSize = CGSizeMake(3 * screenWidth, screenHeight)
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.pagingEnabled = true
        self.scrollView.delegate = self;
        self.scrollView.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(self.scrollView)
        self.addServiceView()
        self.addNeedView()
    }
    
    func addServiceView() {
        self.serviceview =  MEServiceView(frame: CGRect(x: 0, y: 0, width: screenWidth,
            height: screenHeight))
        let tableHeadView = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth,
            height: headViewHeight))
        self.serviceview.tableview.tableHeaderView = tableHeadView
        self.serviceview.tableview.tag = 1001
        self.serviceview.tableview.delegate = self;
        self.scrollView.addSubview(self.serviceview)
    }
    
    func addNeedView() {
        self.needview =  MENeedView(frame: CGRect(x: screenWidth, y: 0, width: screenWidth,
            height: screenHeight))
        let tableHeadView = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth,
            height: headViewHeight))
        self.needview.tableview.tableHeaderView = tableHeadView
        self.needview.tableview.tag = 1002
        self.needview.tableview.delegate = self;
        self.scrollView.addSubview(self.needview)

    }
    
//    MARK: action
    
    func setTableViewContentOffSet(tag: NSInteger!, contentOffSetY: CGFloat) {
        
        var tableViewOffset = contentOffSetY;
        
        if tableViewOffset > 200 {
            
            tableViewOffset = 200
        }
        
        if 1001 == tag {
            self.needview.tableview.setContentOffset(CGPoint(x: 0,y: tableViewOffset) , animated: false)
        }
        
        if 1002 == tag {
            self.serviceview.tableview.setContentOffset(CGPoint(x: 0,y: tableViewOffset) , animated: false)
        }
    }
    
//    MARK: delegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if scrollView.isEqual(self.scrollView) {
            return
        }
        
        if scrollView.contentOffset.y > 200 {
            self.headView.center = CGPoint(x: self.headView.center.x, y: headViewCenterY - 200)
            return
        }
        
        self.headView.center = CGPoint(x: self.headView.center.x, y: headViewCenterY - scrollView.contentOffset.y)    
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        if scrollView.isEqual(self.scrollView) {
            return
        }
        
        self.setTableViewContentOffSet(scrollView.tag, contentOffSetY: scrollView.contentOffset.y)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        if scrollView.isEqual(self.scrollView) {
            return
        }
        self.setTableViewContentOffSet(scrollView.tag, contentOffSetY: scrollView.contentOffset.y)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView .deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}
