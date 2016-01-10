//
//  HomeViewController.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/9.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {

    var jsonModel: HomeJSONModel! {
        didSet {
            jsonModel.posts.forEach {
                if let model = $0 => HomeCellModel.self {
                    cellModelList.append(model)
                }
            }
            tableView.reloadData()
        }
    }
    
    lazy var cellModelList = [HomeCellModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0.1))
    }
    
    func getData() {
        getDataFromUrl(API.Home, method: .GET, parameter: nil) { data, error in

            if let httpError = error {
                print(httpError)
                return
            }
            if let jsonData = data {
                self.jsonModel = jsonData => HomeJSONModel.self
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let answerListController = segue.destinationViewController as? AnswerListViewController, index = tableView.indexPathForSelectedRow?.section {
            let model = cellModelList[index]
            let date = "\(model.date)".stringByReplacingOccurrencesOfString("-", withString: "")
            answerListController.url = API.AnswerList + date + "/" + model.name
        }
    }
}

//MARK: - TableView Data Source
extension HomeViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return cellModelList.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier.Home) as! HomeCell
        
        cell.bindModel(cellModelList[indexPath.section])

        return cell
    }
    
}
