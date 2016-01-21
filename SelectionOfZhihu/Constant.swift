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

struct CellReuseIdentifier {
    static let Home = "HomeCell"
    static let Answer = "AnswerCell"
    
    static let User = "UserCell"
}

struct SegueId {
    static let PopoverSortOrderMenu = "PopoverSortOrderMenu"
    static let SelectedTableItem = "SelectedTableItem"
    static let UserDetail = "UserDetail"
}

struct API {
    static let APIHost = "http://api.kanzhihu.com/"
    static let ArticleHost = "http://www.zhihu.com/"
    
    static let Home = APIHost + "getposts"
    
    static let AnswerList = APIHost + "getpostanswers/"
    
    static let Article = ArticleHost + "question/"
    
    static let TopUser = APIHost + "topuser/agree/"
    
    static let UserDetail = APIHost + "userdetail2/"
}