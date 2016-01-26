//
//  Constant.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 15/12/22.
//  Copyright © 2015年 Sheepy. All rights reserved.
//

import UIKit

let ScreenBounds = UIScreen.mainScreen().bounds
let ScreenWidth = ScreenBounds.width
let ScreenHeight = ScreenBounds.height

let BarHeight = UIApplication.sharedApplication().statusBarFrame.height

struct ArticleCagetory {
    static let categoryDict = [
        "archive": "历史精华",
        "recent": "近日热门",
        "yesterday": "昨日最新"
    ]
}

struct CellReuseIdentifier {
    static let Home = "HomeCell"
    static let Answer = "AnswerCell"
    
    static let User = "UserCell"
    static let UserInfo = "UserInfo"
    static let UserMenu = "UserMenu"
    static let UserDynamic = "UserDynamic"
    static let TopAnswer = "TopAnswer"
    
    static let SearchedUser = "SearchedUser"
}

struct SegueId {
    static let PopoverSortOrderMenu = "PopoverSortOrderMenu"
    static let SelectedTableItem = "SelectedTableItem"
    static let UserDetail = "UserDetail"
}

struct API {
    static let APIHost = "http://api.kanzhihu.com/"
    static let ArticleHost = "http://www.zhihu.com"
    static let ZhuanlanHost = "http://zhuanlan.zhihu.com"
    
    static let Home = APIHost + "getposts"
    
    static let AnswerList = APIHost + "getpostanswers/"
    
    static let Article = ArticleHost + "/question/"
    
    static let TopUserAPI = APIHost + "topuser/"
    static let TopUserOrderByAgreeNum = TopUserAPI + "agree/"
    
    static let UserDetail = APIHost + "userdetail2/"
    
    static let SearchUser = APIHost + "searchuser/"
}