//
//  ComposeViewController.swift
//  Mikor
//
//  Created by Haojun.Zhao on 16/1/19.
//  Copyright © 2016年 Jaiden. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    var selectbar : UITabBarItem!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        LoadBackGournd()
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

        for touch:AnyObject in touches{
            let t:UITouch = touch as! UITouch

            if(t.tapCount == 2)
            {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }
    
    func LoadBackGournd()
    {
        print("加载compose")
        let backview : UIImageView = UIImageView(frame: UIScreen.mainScreen().bounds)
        backview.image = UIImage(named: "ComposeBack")
        self.view.addSubview(backview)
    }
}
