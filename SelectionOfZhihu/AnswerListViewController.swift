//
//  AnswerListViewController.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/10.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class AnswerListViewController: UITableViewController, Refreshable {
    
    let cellHeight = 150 as CGFloat
    
    var url: String! {
        didSet {
            getData()
            tableView.rowHeight = cellHeight
            refreshControl = simpleRefreshControl
        }
    }
    
    var answerList = [AnswerModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var cellCount = 0
    
    func getData() {
        getDataFromUrl(url, method: .GET, parameter: nil) { data in
            if let d = data, jsonModel = d => AnswerListModel.self {
                self.cellCount = jsonModel.count
                self.answerList = jsonModel.answers.flatMap {
                    $0 => AnswerModel.self
                }
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let articleController = segue.destinationViewController as? ArticleViewController, index = tableView.indexPathForSelectedRow?.row {
            let model = answerList[index]
            articleController.urlString = API.Article + model.questionid + "/answer/" + model.answerid
        }
    }
    
}

// MARK: - TableView Data Source
extension AnswerListViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier.Answer) as! AnswerCell
        let index = indexPath.row
        cell.bindModel((answerList[index], index))
        
        return cell
    }
    
}



