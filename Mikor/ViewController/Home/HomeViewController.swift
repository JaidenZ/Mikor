//
//  HomeViewController.swift
//  Mikor
//
//  Created by Haojun.Zhao on 16/1/19.
//  Copyright © 2016年 Jaiden. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController{

    override func viewDidLoad(){
        super.viewDidLoad()
        
        
        
        self.view.backgroundColor = UIColor.whiteColor()
        //设置导航栏的按钮
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.ButtonItem(self, action: "btnAddArticle", imageNormal: "navigationbar_compose", imageHighlight: "navigationbar_compose_highlighted")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.ButtonItem(self, action: "btnfreshQRCode", imageNormal: "navigationbar_pop", imageHighlight: "navigationbar_pop_highlighted")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }

    
    func btnAddArticle()
    {
        print("新增微博")
    }
    
    func btnfreshQRCode()
    {
        print("扫一扫")
    }
    
}
