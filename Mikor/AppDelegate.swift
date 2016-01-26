//
//  AppDelegate.swift
//  Mikor
//
//  Created by Haojun.Zhao on 16/1/19.
//  Copyright © 2016年 Jaiden. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,WeiboSDKDelegate{

    var window: UIWindow?

    
    //微博SDK相关属性
    let AppKey = "4076232121"
    let RedirectURL = "https://api.weibo.com/oauth2/default.html"

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        //初始化微博SDK
        WeiboSDK.enableDebugMode(true)
        WeiboSDK.registerApp(AppKey)
        
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
        
        //提交一个授权请求
        var request:WBAuthorizeRequest! = WBAuthorizeRequest.request() as! WBAuthorizeRequest
        request.redirectURI = RedirectURL
        request.scope = "all"
        WeiboSDK.sendRequest(request)
        
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
            
            let title = "认证结果"
            let message = "response.userId:\((response as! WBAuthorizeResponse).userID)\nresponse.accessToken: \((response as! WBAuthorizeResponse).accessToken)\n响应状态: \(response.statusCode)\n响应UserInfo数据: \(response.userInfo)\n原请求UserInfo数据: \(response.requestUserInfo)"
            
            let showview = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            self.window?.rootViewController!.presentViewController(showview, animated: true, completion: nil)
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


}

