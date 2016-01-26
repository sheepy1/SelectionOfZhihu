//
//  SortOrderMenuController.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/17.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

enum SortOrderItem: Int {
    case Agree
    case Follower
    
    var associatedValue: (keyword: String, desc: String) {
        switch self {
        case .Agree:
            return ("agree", "赞同数")
        case .Follower:
            return ("follower", "粉丝数")
        }
    }
}

class SortOrderMenuController: UITableViewController {
    
    var sortOrder: SortOrderItem!
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        sortOrder = SortOrderItem(rawValue: indexPath.row)
        performSegueWithIdentifier(SegueId.SelectedTableItem, sender: nil)
    }
}
