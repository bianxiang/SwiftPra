//
//  ViewController.swift
//  TestApp
//
//  Created by 也许、 on 16/1/2.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class ViewController: UIViewController,protocolVCDelegate {
    
    // 协议文本框
    @IBOutlet weak var protocolText: UITextField!
    
    // 闭包文本框
    @IBOutlet weak var closureText: UITextField!
    
    // 通知文本框
    @IBOutlet weak var notificationText: UITextField!
    
    // 协议传值
    @IBAction func protocolPassData(sender: UIButton) {
        
        let protocolVC = ProtocolVC()
        protocolVC.title = "协议传值界面"
        // 定义协议,实现协议方法
        protocolVC.delegate = self
        
        self.presentViewController(protocolVC, animated: true, completion: nil)
    }
    
    // 实现ProtocolVC中定义的协议方法
    func getTextValue(title: String) {
        self.protocolText.text = title
    }
    
    // 闭包传值
    @IBAction func closurePassData(sender: UIButton) {
        
        let closureVC = ClosureVC()
        closureVC.title = "闭包传值"
        
        // 实现闭包,通过回调传值
        closureVC.callBack = ({ (title:String) -> Void in
            self.closureText.text = title
        })
        
        self.presentViewController(closureVC, animated: true, completion: nil)
        
    }
    
    // 通知传值
    @IBAction func notificationPassData(sender: UIButton) {
        
        let notificationVC = NotificationVC()
        notificationVC.title = "通知传值"
        self.presentViewController(notificationVC, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // 接收通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "notificationPD:", name: "notificationPassData", object: nil)
        
    }
    
    // 从通知函数中取值
    func notificationPD(info:NSNotification) {
        
        let text = info.userInfo!["text"] as? String
        if let str = text {
            self.notificationText.text = str
            NSNotificationCenter.defaultCenter().removeObserver(self, name: "notificationPassData", object: nil)
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

