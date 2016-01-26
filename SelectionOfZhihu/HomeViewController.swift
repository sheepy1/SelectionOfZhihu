//
//  HomeViewController.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/9.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController, Refreshable {

    let cellHeight = 350 as CGFloat
    
    var cellModelList = [HomeCellModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var cellCount = 0
    
    func getData() {
        getDataFromUrl(API.Home, method: .GET, parameter: nil) { data in
            if let jsonData = data, jsonModel = jsonData => HomeJSONModel.self {
                self.cellCount = jsonModel.count
                self.cellModelList = jsonModel.posts.flatMap {
                    $0 => HomeCellModel.self
                }
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let answerListController = segue.destinationViewController as? AnswerListViewController, index = tableView.indexPathForSelectedRow?.section {
            let model = cellModelList[index]
            let date = "\(model.date)".stringByReplacingOccurrencesOfString("-", withString: "")
            answerListController.url = API.AnswerList + date + "/" + model.name
            //answerListController.title = model.date
            //answerListController.navigationItem.rightBarButtonItem?.title = ArticleCagetory.categoryDict[model.name]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        
        tableView.rowHeight = cellHeight
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0.1))
        refreshControl = simpleRefreshControl
    }
}

//MARK: - TableView Data Source
extension HomeViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return cellCount
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier.Home) as! HomeCell
        let index = indexPath.section
        cell.bindModel((cellModelList[index], index))

        return cell
    }
    
}
