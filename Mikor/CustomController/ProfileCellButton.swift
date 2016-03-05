//
//  ProfileCellButton.swift
//  Mikor
//
//  Created by Haojun.Zhao on 16/3/5.
//  Copyright © 2016年 Jaiden. All rights reserved.
//

import UIKit

class ProfileCellButton: UIButton {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        self.addSubview(_btnTitle)
        self.addSubview(_btnValue)
        self.backgroundColor = UIColor.blackColor()
        
    }


    lazy var _btnTitle:UILabel={
        let title : UILabel = UILabel(frame:CGRectMake(self.bounds.width * 0.1,self.bounds.height * 0.5,self.bounds.width * 0.8 ,self.bounds.height * 0.4))
        title.textAlignment = .Center
        title.font = UIFont(name: "Helvetica", size: 10)
        return title
    }()
    
    lazy var _btnValue:UILabel={
        let value:UILabel = UILabel(frame: CGRectMake(self.bounds.width * 0.1,0,self.bounds.width * 0.8,self.bounds.height*0.4))
        value.textAlignment = .Center
        value.font = UIFont(name: "Helvetica", size: 14)
        //value.textColor = UIColor.blackColor()
        return value
    }()
}
