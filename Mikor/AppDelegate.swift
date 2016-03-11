//
//  AppDelegate.swift
//  Mikor
//
//  Created by Haojun.Zhao on 16/1/19.
//  Copyright © 2016年 Jaiden. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,WeiboSDKDelegate,NSURLSessionDelegate{

    var window: UIWindow?

    var session:NSURLSession!
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        //初始化微博SDK
        WeiboSDK.enableDebugMode(true)
        WeiboSDK.registerApp(AppKey)
        
        //判断授权
        ExiseAuthorization()
        //创建窗口
        self.window?.frame = UIScreen.mainScreen().bounds//将窗口设置为屏幕大小
        
        //获取版本号判断是否展示导航
        let ud = NSUserDefaults.standardUserDefaults()
        let appVersion = "2016.01.22.1.0.2"
        let currentVersion = ud.stringForKey("version")
        if(currentVersion == nil)
        {
            ud.setValue("\(appVersion)", forKey: "version")
            let guideVC = ScrollViewController()
            self.window?.rootViewController = guideVC
        }
        else if(currentVersion != appVersion)
        {
            ud.setValue("\(appVersion)", forKey: "version")
            let guideVC = ScrollViewController()
            self.window?.rootViewController = guideVC
        }
        else
        {
            let tabbarVC = MainTabbarController()
            self.window?.rootViewController = tabbarVC
            
        }
        
        
        
        //显示窗口
        self.window?.makeKeyAndVisible()
        

        return true
    }
    
    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        return WeiboSDK.handleOpenURL(url, delegate: self)
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return WeiboSDK.handleOpenURL(url, delegate: self)
    }
    
    func didReceiveWeiboRequest(request: WBBaseRequest!) {
        if(request.isKindOfClass(WBProvideMessageForWeiboRequest))
        {
            //TODO:sth
        }
    }
    
    func didReceiveWeiboResponse(response: WBBaseResponse!) {
        if(response.isKindOfClass(WBSendMessageToWeiboResponse))
        {
            let title = "发送结果"
            let message = "响应状态: \(response.statusCode)\n响应UserInfo数据: \(response.userInfo)\n原请求UserInfo数据: \(response.requestUserInfo)"
            
            let showview = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            self.window?.rootViewController!.presentViewController(showview, animated: true, completion: nil)
        }
        else if(response.isKindOfClass(WBAuthorizeResponse))
        {
            
            //let title = "认证结果"
            //let message = "response.userId:\((response as! WBAuthorizeResponse).userID)\nresponse.accessToken: \((response as! WBAuthorizeResponse).accessToken)\n响应状态: \(response.statusCode.rawValue)\n响应UserInfo数据: \(response.userInfo)\n原请求UserInfo数据: \(response.requestUserInfo)"
            //let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {action in print("You click the ok")})
            //userID = (response as! WBAuthorizeResponse).userID
            //accessToken = (response as! WBAuthorizeResponse).accessToken
            //refreshToken = (response as! WBAuthorizeResponse).refreshToken
            //let showview = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            //showview.addAction(okAction)
            //self.window?.rootViewController!.presentViewController(showview, animated: true, completion: nil)
            
            if(response.statusCode.rawValue >= 0)
            {
                IsLogin = true
                userID = (response as! WBAuthorizeResponse).userID
                accessToken = (response as! WBAuthorizeResponse).accessToken
                refreshToken = (response as! WBAuthorizeResponse).refreshToken
                
                
                //响应成功 请求用户数据
                //Http GET请求用户信息
                /**
                请求地址:https://api.weibo.com/2/users/show.json*/
                let requesturl = "https://api.weibo.com/2/users/show.json?access_token=\(accessToken)&&uid=\(userID)"
                
                print("开始请求")
                //连接请求
                let request = NSMutableURLRequest(URL: NSURL(string: requesturl)!)
                //微博API使用 GET请求
                request.HTTPMethod = "GET"
                let config = NSURLSessionConfiguration.defaultSessionConfiguration()//默认配置
                config.timeoutIntervalForRequest = 15//超时时间15秒
                session = NSURLSession(configuration: config, delegate: self, delegateQueue: nil)//将本次请求放入列队
                let task = session.dataTaskWithRequest(request, completionHandler:{(
                    data,request,error) -> Void in
                    if error == nil{
                        
                        //解析信息
                        let jsonresult:AnyObject! = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
                        
                        profilemodel.Title = "\(jsonresult.objectForKey("name")!)"
                        profilemodel.Description = "\(jsonresult.objectForKey("description")!)"
                        imageUrlString = "\(jsonresult.objectForKey("avatar_hd")!)"
                        _followers_count = Int32((jsonresult.objectForKey("followers_count")?.integerValue)!)
                        _friends_count = Int32((jsonresult.objectForKey("friends_count")?.integerValue)!)
                        _weibo_count = Int32((jsonresult.objectForKey("statuses_count")?.integerValue)!)
                    }
                    else
                    {
                        print("失败:")
                        print(error?.code)
                        print(error?.localizedDescription)
                        print(error?.localizedFailureReason)
                    }})
                task.resume()

                
                InitBasicInfo()
                
                let tabbarVC = MainTabbarController()
                self.window?.rootViewController = tabbarVC
            }
            ExiseAuthorization()
        }
        
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    /**
     判断授权
     */
    func ExiseAuthorization(){
        let us = NSUserDefaults.standardUserDefaults()
        if(us.boolForKey("isLogin"))
        {
            IsLogin = true
            if(us.stringForKey("accessToken") != nil)
            {
                accessToken = us.stringForKey("accessToken")!
            }
            if(us.stringForKey("refreshToken") != nil)
            {
                refreshToken = us.stringForKey("refreshToken")!
            }
            if(us.stringForKey("userID") != nil)
            {
                userID = us.stringForKey("userID")!
            }
        }
        else
        {
            if(IsLogin)
            {
                us.setValue(accessToken, forKey: "accessToken")
                us.setValue(refreshToken, forKey: "refreshToken")
                us.setValue(userID, forKey: "userID")
            }
        }
    }
    
    /**
     初始化基础数据
     */
    func InitBasicInfo()
    {
        let settinginfo:SectionModel = SectionModel()
        settinginfo.SectionName = "设置选项卡"
        //创建信息
        let rowmodel1 = RowModel()
        rowmodel1.Title = "新的好友"
        rowmodel1.IconImage = "empty_friends"
        let rowmodel2 = RowModel()
        rowmodel2.Title = "我的相册"
        rowmodel2.IconImage = "empty_picture"
        let rowmodel3 = RowModel()
        rowmodel3.Title = "我的关注"
        rowmodel3.IconImage = "empty_default"
        let rowmodel4 = RowModel()
        rowmodel4.Title = "我的粉丝"
        rowmodel4.IconImage = "empty_like"
        
        settinginfo.rowsItem.append(rowmodel1)
        settinginfo.rowsItem.append(rowmodel2)
        settinginfo.rowsItem.append(rowmodel3)
        settinginfo.rowsItem.append(rowmodel4)
        
        let profileinfo:SectionModel = SectionModel()
        profileinfo.SectionName = "我的信息"
        let btnmodel = RowModel()
        
        
        profileinfo.rowsItem.append(profilemodel)
        profileinfo.rowsItem.append(btnmodel)
        
        profileitem.append(profileinfo)
        profileitem.append(settinginfo)
    }


}

