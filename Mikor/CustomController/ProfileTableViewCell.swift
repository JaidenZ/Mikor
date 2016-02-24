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
    //懒加载标题
    lazy var _profiletitle:UILabel = {
        let title:UILabel = UILabel(frame: CGRectMake(self.bounds.width * 0.27,self.bounds.height * 0.45,self.bounds.width*0.5,self.bounds.height*0.5))
        title.font = UIFont(name: "Helvetica", size: 16)
        
        return title
    }()
    lazy var _profiledescrib:UILabel = {
        let describ:UILabel = UILabel(frame: CGRectMake(self.bounds.width * 0.27,self.bounds.height,self.bounds.width*0.5,self.bounds.height*0.5))
        describ.font = UIFont(name: "Helvetica", size: 12)
        describ.textColor = UIColor.grayColor()
        return describ
        
    }()
    //let _profileacces:UIImageView
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundView = UIImageView(image: UIImage(named: "CellBorder"))
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
