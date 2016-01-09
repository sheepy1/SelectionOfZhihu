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
}

struct API {
    static let Home = "http://api.kanzhihu.com/getposts"
}