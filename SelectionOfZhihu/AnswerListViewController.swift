//
//  AnswerListViewController.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/10.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class AnswerListViewController: UITableViewController {
    
    var url: String! {
        didSet {
            getData()
        }
    }
    
    var jsonModel: AnswerListModel! {
        didSet {
            jsonModel.answers.forEach {
                if let answer = $0 => AnswerModel.self {
                    answerList.append(answer)
                }
            }
            
            tableView.reloadData()
        }
    }
    
    lazy var answerList = [AnswerModel]()
    
    func getData() {
        getDataFromUrl(url, method: .GET, parameter: nil) { data, error in
            if let e = error {
                printLog(e)
                return
            }
            
            if let d = data, jsonModel = d => AnswerListModel.self {
                self.jsonModel = jsonModel
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
        return answerList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier.Answer) as! AnswerCell
        let index = indexPath.row
        cell.bindModel(answerList[index], withImageIndex: index)
        
        return cell
    }
    
}



