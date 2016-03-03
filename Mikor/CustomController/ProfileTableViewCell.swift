//
//  ProfileTableViewCell.swift
//  Mikor
//
//  Created by Haojun.Zhao on 16/2/23.
//  Copyright © 2016年 Jaiden. All rights reserved.
//

import UIKit


/*
自定义用户信息页面cell
*/
class ProfileTableViewCell: UITableViewCell {
    
    //懒加载用户头像
    lazy var _profileimage:UIImageView = {
        let imageview:UIImageView = UIImageView(frame: CGRectMake(self.bounds.width * 0.04, self.bounds.height * 0.25, self.bounds.width * 0.18, self.bounds.width * 0.18))
        imageview.layer.cornerRadius = 29
        imageview.layer.masksToBounds = true
        return imageview
    }()
    //懒加载用户标题
    lazy var _profiletitle:UILabel = {
        let title:UILabel = UILabel(frame: CGRectMake(self.bounds.width * 0.27,self.bounds.height * 0.45,self.bounds.width*0.5,self.bounds.height*0.5))
        title.font = UIFont(name: "Helvetica", size: 16)
        return title
    }()
    //懒加载用户描述
    lazy var _profiledescrib:UILabel = {
        let describ:UILabel = UILabel(frame: CGRectMake(self.bounds.width * 0.27,self.bounds.height,self.bounds.width*0.5,self.bounds.height*0.5))
        describ.font = UIFont(name: "Helvetica", size: 12)
        describ.textColor = UIColor.grayColor()
        return describ
    }()
    
    //懒加载功能按钮
    lazy var _profileacces:UIImageView = {
        let accesview:UIImageView = UIImageView(frame: CGRectMake(self.bounds.width * 1.1,self.bounds.height * 0.4,self.bounds.height * 0.15,self.bounds.height * 0.28))
        return accesview
    }()
    //懒加载功能图标
    lazy var _profileicon:UIImageView = {
        let iconview:UIImageView = UIImageView(frame: CGRectMake(self.bounds.height * 0.3, self.bounds.height * 0.25, self.bounds.height * 0.5, self.bounds.height * 0.5))

//        iconview.backgroundColor = UIColor.blackColor()
        return iconview
    }()
    //懒加载功能标题
    lazy var _celltitle:UILabel = {
        let celltitle:UILabel = UILabel(frame: CGRectMake(self.bounds.width*0.15,self.bounds.height * 0.3,self.bounds.width * 0.5,self.bounds.height*0.5))
        celltitle.font = UIFont(name: "Helvetica",size:16)
        return celltitle
    }()
    
    lazy var _btnweibo:UIButton = {
        let btnweibo:UIButton = UIButton(frame: CGRectMake(0,0,self.bounds.width / 3,self.bounds.height))

        btnweibo.setTitleColor(UIColor.blackColor(), forState: .Normal)
        return btnweibo
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundView = UIImageView(image: UIImage(named: "CellBorder"))
        self.addSubview(_profileimage)//用户头像
        self.addSubview(_profiletitle)//用户标题
        self.addSubview(_profiledescrib)//用户描述
        self.addSubview(_profileacces)//功能按钮
        self.addSubview(_profileicon)//功能图标
        self.addSubview(_celltitle)//功能标题
        self.addSubview(_btnweibo)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
