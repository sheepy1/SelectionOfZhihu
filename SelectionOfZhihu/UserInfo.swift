//
//  UserDetail.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/20.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import Foundation

class UserInfo: NSObject {
    var name = ""
    var avatar = ""
    var signature = ""
    //var desc = ""
    //直接声明成 UserDetail 类型也没用，并不会自动转换成 UserDetail 类型
    var detail: AnyObject!
    var star: AnyObject!
    var trend = []
    var topanswers = []
}