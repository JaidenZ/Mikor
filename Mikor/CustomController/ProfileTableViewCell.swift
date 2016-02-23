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
        
        
        let imageview:UIImageView = UIImageView(frame: CGRectMake(self.bounds.width * 0.05, self.bounds.height * 0.15, self.bounds.width * 0.2, self.bounds.width * 0.2))
        
        return imageview
    }()
    //懒加载标题
    lazy var _profiletitle:UILabel = {
        let title:UILabel = UILabel(frame: CGRectMake(self.bounds.width * 0.35,self.bounds.height * 0.4,self.bounds.width*0.5,self.bounds.height*0.5))
        title.font = UIFont(name: "Helvetica", size: 18)
        title.layer.borderColor = UIColor.redColor().CGColor
        return title
    }()
    lazy var _profiledescrib:UILabel = {
        let describ:UILabel = UILabel(frame: CGRectMake(self.bounds.width * 0.35,self.bounds.height * 0.8,self.bounds.width*0.5,self.bounds.height*0.5))
        describ.font = UIFont(name: "Helvetica", size: 12)
        describ.layer.borderColor = UIColor.grayColor().CGColor
        return describ
        
    }()
    //let _profileacces:UIImageView
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.addSubview(_profileimage)
        self.addSubview(_profiletitle)
        self.addSubview(_profiledescrib)
//        self.addSubview(_profileacces)
        
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
