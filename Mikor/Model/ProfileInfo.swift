//
//  ProfileInfo.swift
//  Mikor
//
//  Created by Haojun.Zhao on 16/2/18.
//  Copyright © 2016年 Jaiden. All rights reserved.
//

import Foundation



public class ProfileInfo:NSObject
{
    /**
    用户昵称
    */
    private var name : String = ""
    /**
    用户头像
    */
    private var avatar_hd : String = ""
    /**
    用户背景
    */
    private var coverimage : String = ""
    /**
    用户描述
    */
    private var descriptions : String = ""
    /*
    关注数
    */
    private var followers_count : Int32 = 0
    /*
    粉丝数
    */
    private var friends_count : Int32 = 0
    /*
    位置
    */
    private var location : String = ""
    /*
    微博总数
    */
    private var weibo_count : Int32 = 0
    
    /*
     用户昵称
     */
    public var Name:String{
        get{
            return self.name
        }
        set{
            self.name = newValue
        }
    }
    
    /*
    用户头像
    */
    public var Avatar_hd:String{
        get{
            return self.avatar_hd
        }
        set{
            self.avatar_hd = newValue
        }
    }
    /*
    用户背景
    */
    public var Coverimage:String{
        get{
            return self.coverimage
        }
        set{
            self.coverimage = newValue
        }
    }
    
    /*
    用户描述
    */
    public var Descriptions:String{
        get{
            return self.descriptions
        }
        set{
            self.descriptions = newValue
        }
    }
    
    /*
    位置
    */
    public var Location:String{
        get{
            return self.location
        }
        set{
            self.location = newValue
        }
    }
    
    /*
    关注数
    */
    public var Followers_count:Int32{
        get{
            return self.followers_count
        }
        set{
            self.followers_count = newValue
        }
    }
    
    /*
    粉丝数
    */
    public var Friends_count:Int32{
        get{
            return self.friends_count
        }
        set{
            self.friends_count = newValue
        }
    }
    
    /*
    微博总数
    */
    public var Weibo_count:Int32{
        get{
            return self.weibo_count
        }
        set{
            self.weibo_count = newValue
        }
    }
    
    
/*
用户信息初始化
*/
init(name:String,avatar:String,coverimage:String,descriptions:String,location:String,followers:Int32,friends:Int32,weibocount:Int32) {
        self.name = name
        self.avatar_hd = avatar
        self.coverimage = coverimage
        self.descriptions = descriptions
        self.followers_count = followers
        self.friends_count = friends
        self.location = location
        self.weibo_count = weibocount
        
    }
    
}