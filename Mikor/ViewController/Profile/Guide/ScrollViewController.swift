//
//  ScrollViewController.swift
//  Mikor
//
//  Created by Haojun.Zhao on 16/1/22.
//  Copyright © 2016年 Jaiden. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController,UIScrollViewDelegate {

    var scrollView = UIScrollView()
    var pageControl = UIPageControl()
    var _currentPage = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //添加scrollView
        scrollView.frame = self.view.bounds
        self.view.addSubview(scrollView)
        
        //加载图片
        for var i = 0;i<4;i++
        {
            let imageName:String = String(format:"Guide_%d",i)
            let image:UIImage = UIImage(named: imageName)!
            let imageview:UIImageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
            imageview.image = image
            imageview.frame.origin.x = CGFloat(i) * imageview.frame.size.width
            
            if(i == 3)
            {
                let startBtn = UIButton()
                startBtn.setTitle("开始Mikor", forState: .Normal)
                startBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
                startBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
                startBtn.backgroundColor = UIColor.orangeColor()
                startBtn.frame.size.width = 200
                startBtn.frame.size.height = 30
                startBtn.center.x = scrollView.frame.size.width * 0.5
                startBtn.center.y = scrollView.frame.size.height * 0.9 - 30
                startBtn.addTarget(self, action: "BtnStartClick", forControlEvents: .TouchUpInside)
                startBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
                startBtn.layer.cornerRadius = 0.5
                imageview.userInteractionEnabled = true
                imageview.addSubview(startBtn)
                
            }
            
            scrollView.addSubview(imageview)
        }
        
        //设置属性
        scrollView.contentSize = CGSizeMake(self.view.frame.width * 4, self.view.frame.height)
        scrollView.bounces = false//弹簧特效
        scrollView.pagingEnabled = true//分页
        scrollView.showsHorizontalScrollIndicator = false//纵向滑动
        scrollView.delegate = self
        //初始化按钮
        InitialPageControl()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //初始化滑动按钮
    func InitialPageControl()
    {
        self.pageControl = UIPageControl(frame: CGRectMake(0, scrollView.frame.height * 0.9, scrollView.frame.width, 20))
        self.pageControl.currentPageIndicatorTintColor = UIColor.whiteColor()
        self.pageControl.pageIndicatorTintColor = UIColor.grayColor()
        self.pageControl.numberOfPages = 4
        self.pageControl.currentPage = _currentPage
        self.view.addSubview(self.pageControl)
        
    }
    
    //滑动事件
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let page = Int((scrollView.contentOffset.x + CGFloat( scrollView.frame.width / 2)) / scrollView.frame.width)
        _currentPage = page
        pageControl.currentPage = page
        
        //print(page)
        
    }

    //完成滑动时
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {

    }
    //开始事件
    func BtnStartClick()
    {
        let tabbarVC = MainTabbarController()
        tabbarVC.modalTransitionStyle = .CrossDissolve
        self.presentViewController(tabbarVC, animated: true, completion: nil)
    }
}
