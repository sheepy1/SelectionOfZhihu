//
//  SortOrderMenuController.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/17.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class SortOrderMenuController: UITableViewController {
    
    typealias SortOrder = (name: String, id: String)
    var sortOrder: SortOrder!
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            sortOrder = ("按赞同数", "agree")
        case 1:
            sortOrder = ("按关注数", "follow")
        default:
            break
        }
        performSegueWithIdentifier(SegueId.SelectedTableItem, sender: nil)
    }
}
