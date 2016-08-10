//
//  MEMsgViewController.swift
//  linkUS
//
//  Created by  黎明 on 16/8/6.
//  Copyright © 2016年 sujeking. All rights reserved.
//

import UIKit

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
        self.headView = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 244))
        self.headView.backgroundColor = UIColor.brownColor()
        self.headViewCenterY = self.headView.center.y
        self.view.addSubview(self.headView)
    
    }

    func addSessionView() {
        self.sessionView = UIView(frame: CGRect(x: 0, y: 200, width: CGRectGetWidth(UIScreen.mainScreen().bounds), height: 44))
        self.sessionView.backgroundColor = UIColor.redColor()
        self.headView.addSubview(self.sessionView)
    }
    
    func addScrollView() {
        self.scrollView = UIScrollView(frame: CGRect(x: 0, y: 0,
            width: CGRectGetWidth(UIScreen.mainScreen().bounds),
            height: CGRectGetHeight(UIScreen.mainScreen().bounds)))
        self.scrollView.contentSize = CGSizeMake(3 * screenWidth, screenHeight)
        self.scrollView.showsVerticalScrollIndicator = false
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
            height: 244))
        self.serviceview.tableview.tableHeaderView = tableHeadView
        self.serviceview.tableview.delegate = self;
        self.scrollView.addSubview(self.serviceview)
    }
    
    func addNeedView() {
        self.needview =  MENeedView(frame: CGRect(x: screenWidth, y: 0, width: screenWidth,
            height: screenHeight))
        let tableHeadView = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth,
            height: 244))
        self.needview.tableview.tableHeaderView = tableHeadView
        self.needview.tableview.delegate = self;
        self.scrollView.addSubview(self.needview)

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
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
    }
    
}
