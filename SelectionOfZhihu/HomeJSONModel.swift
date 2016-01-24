//
//  HomeJSONModel.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/10.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import Foundation

class HomeJSONModel: NSObject {
    var error = ""
    var count = 0
    //因为通过 Runtime 设置的值只能是 NSObject 的子类，如果定义[Post]的话，取元素的时候会报错（因为 NSArray 的元素是 AnyObject 类型，不会自动转化成 Post
    var posts = []
}