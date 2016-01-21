//
//  TopUserViewController.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/11.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class TopUserViewController: UITableViewController {
    
    var cellModelList = [TopUserModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
//    var jsonModelList = [JSON]() {
//        didSet {
//            tableView.reloadData()
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
    }
    
    func getData() {
        getDataFromUrl(API.TopUser, method: .GET, parameter: nil) { data in
            if let jsonData = data, model = jsonData => UserJSONModel.self {
                self.cellModelList = model.topuser.flatMap {
                    $0 => TopUserModel.self
                }
            }
//            if let jsonData = data {
//                let json = JSON(data: jsonData).dictionaryValue
//                self.jsonModelList = json["topuser"]!.arrayValue
//            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let id = segue.identifier else {
            return
        }
        switch id {
        case SegueId.PopoverSortOrderMenu:
            let menuController = segue.destinationViewController
            menuController.popoverPresentationController?.delegate = self
        case SegueId.UserDetail:
            let userDetailController = segue.destinationViewController as! UserDetailViewController
            let selectedIndex = tableView.indexPathForSelectedRow!.row
            userDetailController.userHash = cellModelList[selectedIndex].userHash
        default:
            break
        }
    }
    
    @IBAction func unwindSegueToTopUserPage(segue: UIStoryboardSegue) {
        if let segueId = segue.identifier, case segueId = SegueId.SelectedTableItem {
            let sortOrder = (segue.sourceViewController as! SortOrderMenuController).sortOrder
            navigationItem.leftBarButtonItem?.title = sortOrder.name
        }
    }
}

// MARK: - TableView Data Source
extension TopUserViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModelList.count 
//        return jsonModelList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier.User) as! TopUserCell
        let index = indexPath.row
        cell.bindModel(cellModelList[index], withImageIndex: index)
    
//        cell.bindModel(jsonModelList[index], withIndex: index)
        return cell
    }
}

extension TopUserViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
}