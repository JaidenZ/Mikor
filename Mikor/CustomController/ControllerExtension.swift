//
//  ControllerExtension.swift
//  Mikor
//
//  Created by Haojun.Zhao on 16/1/20.
//  Copyright © 2016年 Jaiden. All rights reserved.
//

import UIKit

//UIBarButtonItem扩展
extension UIBarButtonItem
{
    //SEL static 只实例化一次
    //按钮扩展
    static func ButtonItem(target:AnyObject,action: Selector,imageNormal:String,imageHighlight:String)->UIBarButtonItem
    {
        let item:UIButton = UIButton()
        item.setBackgroundImage(UIImage(named: imageNormal), forState:UIControlState.Normal)
        item.setBackgroundImage(UIImage(named: imageHighlight), forState: UIControlState.Highlighted)
        item.frame.size = item.currentBackgroundImage!.size//设置按钮大小为图片大小
        item.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        
        return UIBarButtonItem(customView: item)
        
    }
    
    //文本扩展
    static func FontItem(target:AnyObject,action:Selector,text:String)->UIBarButtonItem
    {
        
        
        
        let item:UIButton = UIButton(frame: CGRectMake(0,0,60,0))
        item.layer.borderWidth = 0.5
        item.layer.borderColor = UIColor.blackColor().CGColor
        item.setTitle(text, forState: .Normal)
        item.setTitleColor(UIColor.blackColor(), forState: .Normal)
        item.setTitleColor(UIColor.orangeColor(), forState: .Highlighted)
        item.titleLabel?.font = UIFont(name: "Helvetica", size: 13)
        item.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        
        return UIBarButtonItem(customView: item)
        
    }
    
}









