//
//  MELoginViewController.swift
//  linkme
//
//  Created by sujeking on 16/8/5.
//  Copyright © 2016年 sujeking. All rights reserved.
//

import UIKit

class MELoginViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var lineLayerName: CALayer!
    var lineLayerPass: CALayer!
    var userModel: MEUserModel!
    let lineColor:CGColor = UIColor.whiteColor().CGColor
    
//    MARK: - lefe
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.setupSubViews()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setupSubViews() {
        self.userNameTextField.delegate = self
        self.passwordTextField.delegate = self
        
        self.layerName()
        self.layerPass()
        
        self.view.layer.addSublayer(self.lineLayerName)
        self.view.layer.addSublayer(self.lineLayerPass)
        
        
        self.loginButton.layer.borderWidth = 0
        self.loginButton.layer.borderColor = self.lineColor
        self.loginButton.layer.cornerRadius = 5
        self.loginButton.layer.masksToBounds = true
        
        self.loginButton.addTarget(self, action: #selector(loginButtonClick),
                                   forControlEvents: UIControlEvents.TouchUpInside)
        
        
    }

//    MARK: - UITextFieldDelegate
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.isEqual(self.userNameTextField) {
            self.showNameLayerAnimation()
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if textField.isEqual(self.userNameTextField) {
            self.hiddenNameLayerAnimation()
        }
        if textField.isEqual(self.passwordTextField) {
            self.hiddenPassLayerAnimation()
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.isEqual(self.userNameTextField) {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func transferPath() -> UIBezierPath{
        let transferPath = UIBezierPath()
        transferPath.moveToPoint(CGPointMake(0, 0))
        transferPath.addCurveToPoint(CGPointMake(26.852, 26.974), controlPoint1:CGPointMake(14.83, 0), controlPoint2:CGPointMake(26.852, 12.077))
        transferPath.addCurveToPoint(CGPointMake(0, 53.949), controlPoint1:CGPointMake(26.852, 41.872), controlPoint2:CGPointMake(14.83, 53.949))
        
        return transferPath;
    }
    
    func layerName() {
        lineLayerName = CALayer.init()
        let x: CGFloat     = CGRectGetMinX(self.userNameTextField.frame)
        let y: CGFloat     = CGRectGetMaxY(self.userNameTextField.frame) + 5
        let height: CGFloat = 1.0
        lineLayerName.frame = CGRectMake(x, y, 0, height)
        lineLayerName.backgroundColor = self.lineColor
    }
    
    func layerPass() {
        lineLayerPass = CALayer.init()
        let x: CGFloat     = CGRectGetMaxX(self.passwordTextField.frame)
        let y: CGFloat     = CGRectGetMaxY(self.passwordTextField.frame) + 5
        let height: CGFloat = 1.0
        lineLayerPass.frame = CGRectMake(x, y, 0, height)
        lineLayerPass.backgroundColor = self.lineColor
    }
    
//    MARK: - 动画
    
    func showNameLayerAnimation() {
        var rect = self.lineLayerName.frame
        rect.size.width = CGRectGetWidth(self.userNameTextField.frame)
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.5)
        CATransaction.setCompletionBlock {
            let rect = self.lineLayerName.frame
            print("动画结束 \(NSStringFromCGRect(rect))")
        }
        self.lineLayerName.frame = rect
        CATransaction.commit()
    }
    
    func hiddenNameLayerAnimation() {
        var rect = self.lineLayerName.frame
        if rect.size.width == 0 {
            return;
        }
        
        rect.origin.x = CGRectGetMaxX(self.userNameTextField.frame)
        rect.size.width = 0.0;
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.5)
        CATransaction.setCompletionBlock {
            var restRect = self.lineLayerName.frame
            restRect.origin.x = CGRectGetMinX(self.userNameTextField.frame)
            self.lineLayerName.frame = restRect
            self.showPassLayerAnimation()
        }
        self.lineLayerName.frame = rect
        CATransaction.commit()
    }
    
    func showPassLayerAnimation() {
        var rect = self.lineLayerPass.frame
        rect.size.width = CGRectGetWidth(self.passwordTextField.frame)
        rect.origin.x = CGRectGetMinX(self.passwordTextField.frame)
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.5)
        CATransaction.setCompletionBlock {
            self.passwordTextField.becomeFirstResponder()
        }
        self.lineLayerPass.frame = rect
        CATransaction.commit()
    }
    
    func hiddenPassLayerAnimation() {
        var rect = self.lineLayerPass.frame
        rect.size.width = 0.0;
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.5)
        CATransaction.setCompletionBlock {
            var restRect = self.lineLayerPass.frame
            restRect.origin.x = CGRectGetMaxX(self.passwordTextField.frame)
            self.lineLayerPass.frame = restRect
            
            let isFull = MELoginViewModel.checkFullUserNameAndPassword(self.userNameTextField.text!, passWordString: self.passwordTextField.text!)
            
            if isFull {
                self.showloginButtonAnimation()
            } else {
                
            }
            
        }
        self.lineLayerPass.frame = rect
        CATransaction.commit()
    }
    
    func showloginButtonAnimation() {
        CATransaction.begin()
        CATransaction.setAnimationDuration(5)
        self.loginButton.layer.borderWidth = 0.5
        CATransaction.commit()
    }
    
//    MARK: - user Action
    func loginButtonClick() {
        MELoginViewModel.loginAction("", passWord: "", superViewController: self);
    }
}
