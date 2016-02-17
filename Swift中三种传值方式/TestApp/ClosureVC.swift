//
//  ClosureVC.swift
//  TestApp
//
//  Created by 也许、 on 16/1/2.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

// 定义闭包
typealias ClosureCallBack = (title:String) -> Void

class ClosureVC: UIViewController {
    
    var textFiled:UITextField?
    
    // 定义闭包
    var callBack:ClosureCallBack?

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
        
        // 通过闭包传值
        self.callBack!(title: self.textFiled!.text!)
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
