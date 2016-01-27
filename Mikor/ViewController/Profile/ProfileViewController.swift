//
//  ProfileViewController.swift
//  Mikor
//
//  Created by Haojun.Zhao on 16/1/19.
//  Copyright © 2016年 Jaiden. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    override func viewDidLoad(){
        super.viewDidLoad()
        
        print("加载一次")
        //设置导航栏透明
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        //self.navigationController?.navigationBar.shadowImage = UIImage()
        if(IsLogin)
        {
            InitUser()
        }
        else
        {
            InitVisitor()
        }
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.FontItem(self, action: "Setting", text: "设置")

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
    初始化用户信息
    */
    func InitUser()
    {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.FontItem(self, action: "AddFirends", text: "添加好友")
    }
    /**
    初始化游客信息
    */
    func InitVisitor()
    {
        
        //设置背景
        let background = UIImageView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height))
        background.backgroundColor = UIColor.grayColor()
        background.image = UIImage(named: "UserBackDefault1")
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.ExtraLight)
        let blureView = UIVisualEffectView(effect: blurEffect)
        blureView.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height)
        background.addSubview(blureView)
        
        
        //设置头像
        let headborderlong = self.view.bounds.width/5
        let head = UIImageView(frame: CGRectMake(self.view.bounds.width/2 - headborderlong/2, self.view.bounds.height * 0.1, headborderlong, headborderlong))
        head.backgroundColor = UIColor.whiteColor()
        //缩放默认头像
        let headtemp = UIImage(named: "defaultuser_128px")
        let size = headtemp?.size
        let width = (size?.width)! * 0.85
        let height = (size?.height)! * 0.85
        UIGraphicsBeginImageContext(size!)
        headtemp?.drawInRect(CGRectMake((size?.width)!/2 - width/2, 0, width, height))
        let newhead = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        head.image = newhead
        
        head.layer.cornerRadius = headborderlong/2
        head.layer.masksToBounds = true
        
        //设置详细部分
        let lrdetaillback = UIImageView(frame: CGRectMake(0, self.view.bounds.height*0.2 + headborderlong, self.view.bounds.width, (self.view.bounds.height * 0.8)-headborderlong))
        lrdetaillback.backgroundColor = UIColor.whiteColor()
        lrdetaillback.userInteractionEnabled = true
        let lblshow = UILabel(frame: CGRectMake(0,lrdetaillback.bounds.height * 0.2,self.view.bounds.width,self.view.bounds.height * 0.1))
        lblshow.text = "登录后，您的信息将会显示在这里，展示给别人"
        lblshow.font = UIFont(name: "Helvetica", size: 14)
        lblshow.textColor = UIColor(red: 47/225, green: 62/225, blue: 77/225, alpha: 1)
        lblshow.textAlignment = NSTextAlignment.Center
        lrdetaillback.addSubview(lblshow)
        
        //设置按钮
        let btnRegist = UIButton(frame: CGRectMake((lrdetaillback.bounds.width - 268)/2,lrdetaillback.bounds.height * 0.4,128,40))
        let btnlogin = UIButton(frame: CGRectMake(lrdetaillback.bounds.width/2 + 20 ,lrdetaillback.bounds.height * 0.4,128,40))
        
        btnlogin.layer.borderColor = UIColor.grayColor().CGColor
        btnRegist.layer.borderColor = UIColor.grayColor().CGColor
        btnlogin.layer.borderWidth = 0.5
        btnRegist.layer.borderWidth = 0.5
        btnlogin.layer.cornerRadius = 3
        btnRegist.layer.cornerRadius = 3
        
        
        btnlogin.setTitle("登录", forState: UIControlState.Normal)
        btnlogin.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btnlogin.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        btnlogin.addTarget(self, action: "BtnHandler", forControlEvents: UIControlEvents.TouchUpInside)
        btnlogin.tag = 0
        
        btnRegist.setTitle("注册", forState: UIControlState.Normal)
        btnRegist.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        btnRegist.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        btnRegist.addTarget(self, action: "BtnHandler", forControlEvents: UIControlEvents.TouchUpInside)
        btnRegist.tag = 1
        lrdetaillback.addSubview(btnlogin)
        lrdetaillback.addSubview(btnRegist)
        
        self.view.addSubview(background)
        self.view.addSubview(head)
        self.view.addSubview(lrdetaillback)

    }
    
    func AddFirends()
    {
        print("添加好友")
        
    }
    
    func Setting()
    {
        print("设置")
    }
    
    func BtnHandler()
    {
        //提交一个授权请求
        var request:WBAuthorizeRequest! = WBAuthorizeRequest.request() as! WBAuthorizeRequest
        request.redirectURI = RedirectURL
        request.scope = "all"
        WeiboSDK.sendRequest(request)
    }
}
