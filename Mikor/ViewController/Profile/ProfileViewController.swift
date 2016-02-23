//
//  ProfileViewController.swift
//  Mikor
//
//  Created by Haojun.Zhao on 16/1/19.
//  Copyright © 2016年 Jaiden. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,NSURLSessionDelegate,NSURLSessionDataDelegate,UITableViewDelegate,UITableViewDataSource {
    var session:NSURLSession!
    
    var userinfotb:UITableView?
    var profileitem:[SectionModel] = []
    
    
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
            
            let settinginfo:SectionModel = SectionModel()
            //创建信息
            let rowmodel1 = RowModel()
            rowmodel1.Title = "新的好友"
            let rowmodel2 = RowModel()
            rowmodel2.Title = "我的相册"
            let rowmodel3 = RowModel()
            rowmodel3.Title = "我的关注"
            let rowmodel4 = RowModel()
            rowmodel4.Title = "我的粉丝"
            
            settinginfo.rowsItem.append(rowmodel1)
            settinginfo.rowsItem.append(rowmodel2)
            settinginfo.rowsItem.append(rowmodel3)
            settinginfo.rowsItem.append(rowmodel4)
            settinginfo.SectionName = "设置选项卡"
            
            let profileinfo:SectionModel = SectionModel()
            profileinfo.SectionName = "我的信息"
            let profilemodel = RowModel()
            profilemodel.Title = "赵浩君Jaiden"
            profilemodel.Description = "简介:不吃核桃"
            let p = RowModel()
            p.Title = "粉丝数"
        
            profileinfo.rowsItem.append(profilemodel)
            
            
            profileinfo.rowsItem.append(p)
            profileitem.append(profileinfo)
            profileitem.append(settinginfo)
            //创建分组样式的UITableView
            userinfotb = UITableView(frame: self.view.bounds,style: .Grouped)
            userinfotb?.dataSource = self
            userinfotb?.delegate = self
            userinfotb?.separatorStyle = .None
            self.view.addSubview(userinfotb!)
            //InitVisitor()
        }
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.FontItem(self, action: "Setting", text: "设置")

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //返回分组数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return profileitem.count
    }
    
    //返回每组行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileitem[section].RowsCount()
    }
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell
    {
<<<<<<< HEAD
        
        var reuseidenty:String = "profiletableview"
        var cell = ProfileTableViewCell(style: .Default, reuseIdentifier: reuseidenty)
        
        if(indexPath.section == 0 && indexPath.row == 0)
        {
            //获取头像
            var image:UIImage = UIImage(named: "defaultuser_128px")!
            cell._profileimage.image = image
            cell._profiletitle.text = profileitem[indexPath.section].rowsItem[indexPath.row].Title
            cell._profiledescrib.text = profileitem[indexPath.section].rowsItem[indexPath.row].Description
   
        }else
        {
            cell._profiletitle.text = profileitem[indexPath.section].rowsItem[indexPath.row].Title
        }
=======
        //声明cell标示用于加载缓存池
        //cell的标示声明成静态变量有利于性能优化
        static var profileinfocellID = "profileInfo"
        static var profilefuncID = "profileFunc"

        //根据标志在缓存池里取cell
        var cell : UITableViewCell

        if(indexPath.section == 0)
        {
            cell = tableview.dequeueReusableCellWithIdentifier(profileinfocellID)
        }
        else if(indexPath.section == 1)
        {
            cell = tableview.dequeueReusableCellWithIdentifier(profilefuncID)
        }

        if(cell == nil)
        {
            if(indexPath.section == 0)
            {
                cell = UITableView(style: UITableViewCellStyle.Subtitle,reseIdentifier: profileinfocellID)
                cell.accessoryType = .None

                //设置头像
                cell.imageView?.image = UIImage(named: "defaultuser_128px")
            }
            else if(indexPath.section == 1)
            {
                cell = UITableView(style: UITableViewCellStyle.Subtitle,reseIdentifier: profilefuncID)
                cell.accessoryType = .None
                //设置功能图标
                
            }

            cell.textLabel?.text = profileitem[indexPath.section].rowsItem[indexPath.row].Title
            cell.detailTextLabel?.text = profileitem[indexPath.section].rowsItem[indexPath.row].Description
        }

>>>>>>> origin/master
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
       if(indexPath.section == 0 && indexPath.row == 0)
       {
        return 80
        }
        return 44
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return profileitem[section].SectionName
//    }
    
//    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return profileitem[section].SectionDescription
//    }
    
    /**
    初始化用户信息
    */
    func InitUser()
    {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.FontItem(self, action: "AddFirends", text: "添加好友")
        
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
                
                print("解析")
                print("name:\(jsonresult.objectForKey("name")!)")
                print("end")

            }
            else
            {
                print("失败:")
                print(error?.code)
                print(error?.localizedDescription)
                print(error?.localizedFailureReason)
            }})
        task.resume()

    }
    
    
    /**
    初始化游客信息
    */
    func InitVisitor()
    {
        
        //设置背景
        let background = UIImageView(frame: CGRectMake(0, 66, self.view.bounds.width, self.view.bounds.height*0.3))
        background.backgroundColor = UIColor.grayColor()
        background.image = UIImage(named: "UserBackDefault1")
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.ExtraLight)
        let blureView = UIVisualEffectView(effect: blurEffect)
        blureView.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height)
        //background.addSubview(blureView)
        
        
        //设置头像
        let headborderlong = self.view.bounds.width/5
        let head = UIImageView(frame: CGRectMake(self.view.bounds.width/2 - headborderlong/2, self.view.bounds.height * 0.2, headborderlong, headborderlong))
        head.backgroundColor = UIColor.whiteColor()
        //缩放默认头像
        let headtemp = UIImage(named: "defaultuser_128px")
//        let size = headtemp?.size
//        let width = (size?.width)!
//        let height = (size?.height)!
//        UIGraphicsBeginImageContext(size!)
//        headtemp?.drawInRect(CGRectMake((size?.width)!/2 - width/2, 0, width, height))
//        let newhead = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
        head.image = headtemp
        
        head.layer.cornerRadius = headborderlong/2
        head.layer.masksToBounds = true
        
        //设置详细部分
        let lrdetaillback = UIImageView(frame: CGRectMake(0, self.view.bounds.height*0.3 + headborderlong, self.view.bounds.width, (self.view.bounds.height * 0.7)-headborderlong))
        lrdetaillback.backgroundColor = UIColor.whiteColor()
        lrdetaillback.userInteractionEnabled = true
        let lblshow = UILabel(frame: CGRectMake(0,lrdetaillback.bounds.height * 0.2,self.view.bounds.width,self.view.bounds.height * 0.1))
        lblshow.text = "登录后，您的信息将会显示在这里，展示给别人"
        lblshow.font = UIFont(name: "Helvetica", size: 14)
        lblshow.textColor = UIColor(red: 47/225, green: 62/225, blue: 77/225, alpha: 1)
        lblshow.textAlignment = NSTextAlignment.Center
        lrdetaillback.addSubview(lblshow)
        
        //设置按钮
        let btnlogin = UIButton(frame: CGRectMake(lrdetaillback.bounds.width/2 - 128 ,lrdetaillback.bounds.height * 0.4,256,40))
        btnlogin.backgroundColor = UIColor.orangeColor()
        btnlogin.layer.cornerRadius = 3
        btnlogin.setTitle("使用新浪微博登录", forState: UIControlState.Normal)
        btnlogin.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
                btnlogin.addTarget(self, action: "LoginClick", forControlEvents: UIControlEvents.TouchUpInside)
        btnlogin.tag = 0
        lrdetaillback.addSubview(btnlogin)
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
    
    func LoginClick()
    {
        //提交一个授权请求
        let request:WBAuthorizeRequest! = WBAuthorizeRequest.request() as! WBAuthorizeRequest
        request.redirectURI = RedirectURL
        request.scope = "all"
        WeiboSDK.sendRequest(request)
    }
    
    
    /**
     异步请求
     用于进行微博API HTTP请求
     */
    func AsynchronousRequest(url:String)
    {
        
        print("开始请求")
        //连接请求
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        //微博API使用 GET请求
        request.HTTPMethod = "GET"
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()//默认配置
        config.timeoutIntervalForRequest = 15//超时时间15秒
        session = NSURLSession(configuration: config, delegate: self, delegateQueue: nil)//将本次请求放入列队
        let task = session.dataTaskWithRequest(request, completionHandler:{(
            data,request,error) -> Void in
            if error == nil{
                
                
            }
            else
            {
                print("失败:")
                print(error?.code)
                print(error?.localizedDescription)
                print(error?.localizedFailureReason)
            }})
        task.resume()
    }
}
