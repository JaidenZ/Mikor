//
//  AppcoreData.swift
//  Mikor
//
//  Created by Haojun.Zhao on 16/1/27.
//  Copyright © 2016年 Jaiden. All rights reserved.
//

import Foundation


//微博授权信息
let AppKey:String = "4076232121"

/**
回调地址
*/
let RedirectURL:String = "https://api.weibo.com/oauth2/default.html"

/**
是否登录
*/
var IsLogin:Bool = false

/**
用户ID
*/
var userID :String = ""

/**
认证口令
*/
var accessToken:String = ""

/**
认证过期时间
*/
var expirationDate:NSData = NSData()

/**
当认证口令过期时用于换取认证口令的更新口令
*/
var refreshToken:String = ""

