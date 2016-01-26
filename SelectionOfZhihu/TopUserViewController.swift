//
//  TopUserViewController.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/11.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class TopUserViewController: UITableViewController, Refreshable {
    
    var url = API.TopUserOrderByAgreeNum {
        didSet {
            getData()
        }
    }
    
    var cellModelList = [TopUserModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var cellCount = 0
    
    func getData() {
        getDataFromUrl(url, method: .GET, parameter: nil) { data in
            if let jsonData = data, model = jsonData => UserJSONModel.self {
                self.cellCount = model.count
                self.cellModelList = model.topuser.flatMap {
                    $0 => TopUserModel.self
                }
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let id = segue.identifier else { return }
        
        switch id {
        case SegueId.PopoverSortOrderMenu:
            let menuController = segue.destinationViewController
            menuController.popoverPresentationController?.delegate = self
        case SegueId.UserDetail:
            let userDetailController = segue.destinationViewController as! UserDetailViewController
            let selectedIndex = tableView.indexPathForSelectedRow!.row
            userDetailController.userHash = cellModelList[selectedIndex].userHash
            
            //确保滑动返回依旧可用
            navigationController!.interactivePopGestureRecognizer!.delegate = nil;
        default:
            break
        }
    }
    
    @IBAction func unwindSegueToTopUserPage(segue: UIStoryboardSegue) {
        if let segueId = segue.identifier, case segueId = SegueId.SelectedTableItem {
            let sortOrder = (segue.sourceViewController as! SortOrderMenuController).sortOrder
            navigationItem.leftBarButtonItem?.title = sortOrder.associatedValue.desc
            url = API.TopUserAPI + sortOrder.associatedValue.keyword
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        refreshControl = simpleRefreshControl
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

// MARK: - TableView Data Source
extension TopUserViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier.User) as! TopUserCell
        let index = indexPath.row
        cell.bindModel((cellModelList[index], index))

        return cell
    }
}

extension TopUserViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
}