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
    var name : String!
    /**
    用户头像
    */
    var avatar_hd : String!
    /**
    用户背景
    */
    var coverimage : String!
    /**
    用户描述
    */
    var descriptions : String!
    /*
    关注数
    */
    var followers_count : Int32 = 0
    /*
    粉丝数
    */
    var friends_count : Int32 = 0
    /*
    位置
    */
    var location : String!
    /*
    微博总数
    */
    var weibo_count : Int32 = 0
    
        
    
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