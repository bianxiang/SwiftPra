//
//  NotificationVC.swift
//  TestApp
//
//  Created by 也许、 on 16/1/2.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class NotificationVC: UIViewController {

    
    var textFiled:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let screenWidth = self.view.frame.size.width
        
        textFiled = UITextField(frame: CGRectMake( 10, 40, screenWidth - 20, 35))
        textFiled?.borderStyle = UITextBorderStyle.RoundedRect
        textFiled?.placeholder = "输入..."
        textFiled?.becomeFirstResponder()
        
        let btn = UIButton(frame: CGRectMake( 10, 80, screenWidth - 20, 35))
        btn.setTitle("确定", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        btn.addTarget(self, action: "save", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(textFiled!)
        self.view.addSubview(btn)

    }
    
    func save() {
        
        let dataDic = NSMutableDictionary()
        dataDic.setValue(self.textFiled?.text, forKey: "text")
        
        // 注册通知
        let notification = NSNotification(name: "notificationPassData", object: nil, userInfo: dataDic as [NSObject:AnyObject] )
        // 发送通知
        NSNotificationCenter.defaultCenter().postNotification(notification)
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
