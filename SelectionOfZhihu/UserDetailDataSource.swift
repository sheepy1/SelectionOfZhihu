//
//  UserDetailDataSource.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/27.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class UserDynamicDataSource: NSObject, UITableViewDataSource {
    
    var userDynamicList: [UserDynamicModel]!
    
    var name: String!
    
    var avatar: String!
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDynamicList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier.UserDynamic) as! UserDynamicCell
        
        cell.bindModel((name, avatar, userDynamicList[indexPath.row]))
        return cell
    }
}

class TopAnswerDataSource: NSObject, UITableViewDataSource {
    
    var topAnswerList: [TopAnswerModel]!
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topAnswerList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier.TopAnswer) as! TopAnswerCell
        
        cell.bindModel(topAnswerList[indexPath.row])
        return cell
    }
    
}