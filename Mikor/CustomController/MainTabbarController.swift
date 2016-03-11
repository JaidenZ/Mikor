//
//  MainTabbarController.swift
//  Mikor
//
//  Created by Haojun.Zhao on 16/1/20.
//  Copyright © 2016年 Jaiden. All rights reserved.
//

import UIKit

//主页自定义TabBar
class MainTabbarController: UITabBarController , UITabBarControllerDelegate{
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        //创建子视图控制器
        let Home = HomeViewController()
        let Mess = MessViewController()
        let Found = FoundViewController()
        let Profile = ProfileViewController()
        
        self.addChildViewController(InitChildVC(Home, title: "主页", imageNormal: "tabbar_home", imageSlected: "tabbar_home_highlighted"))
        self.addChildViewController(InitChildVC(Mess, title: "消息", imageNormal: "tabbar_message_center", imageSlected: "tabbar_message_center_highlighted"))
        
        //composeview
        self.addChildViewController(UIViewController())
        
        self.addChildViewController(InitChildVC(Found, title: "发现", imageNormal: "tabbar_discover", imageSlected: "tabbar_discover_highlighted"))
        self.addChildViewController(InitChildVC(Profile, title: "我", imageNormal: "tabbar_profile", imageSlected: "tabbar_profile_highlighted"))
        //添加compose按钮
        SetComposeButton()
        
        //把自己作为自己的代理(委托自己操作)
        self.delegate = self
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //初始化子视图控制器
    func InitChildVC(childVC:UIViewController,title:String,imageNormal:String,imageSlected:String) ->UINavigationController
    {
        let selectedtext = NSMutableDictionary()
        selectedtext[NSForegroundColorAttributeName] = UIColor.orangeColor()
        childVC.title = title
        childVC.tabBarItem.image = UIImage(named: imageNormal)?.imageWithRenderingMode(
        .AlwaysOriginal)
        childVC.tabBarItem.selectedImage = UIImage(named: imageSlected)?.imageWithRenderingMode(
            .AlwaysOriginal)
        childVC.tabBarItem.setTitleTextAttributes(selectedtext as? [String:AnyObject], forState: .Selected)
        
        //添加navigationcontroller
        let nv = UINavigationController(rootViewController: childVC)
        return nv
        
    }
    
 
    //设置ComposeButton
    func SetComposeButton()
    {
        let width = self.tabBar.bounds.width/CGFloat(self.viewControllers!.count)
        let rect = CGRect(x: 0, y: 0, width: width, height: self.tabBar.bounds.height)
        composeButton.frame = CGRectOffset(rect, 2 * width, 0)
        
    }
    
    
    //创建一个懒加载的主页面compose按钮
    lazy private var composeButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: .Normal)
        button.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: .Highlighted)
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button.9"), forState: .Normal)
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button.9_highlighted"), forState: .Highlighted)
        button.addTarget(self, action: "BtnComposeClick", forControlEvents: .TouchUpInside)
        self.tabBar.addSubview(button)
        //button.bringSubviewToFront(self.tabBar)
        return button
    }()
    
    
    //判断是否需要切换tabbar
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        if(viewController.tabBarItem.title == nil)
        {
            let view = ComposeViewController()
            view.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
            self.presentViewController(view,animated:true,completion:nil)
            return false
            
        }
        return true
    }
    

    
}
