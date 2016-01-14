//
//  TopUserViewController.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/11.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class TopUserViewController: UITableViewController {

    var jsonModel: UserJSONModel! {
        didSet {
            jsonModel.topuser.forEach {
                if let model = $0 => TopUserModel.self {
                    self.cellModelList.append(model)
                }
            }
            
            tableView.reloadData()
        }
    }
    
    lazy var cellModelList = [TopUserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
    }
    
    func getData() {
        getDataFromUrl(API.TopUser, method: .GET, parameter: nil) { data, error in
            if let e = error {
                print(e)
                return
            }
            
            if let jsonData = data, model = jsonData => UserJSONModel.self {
                self.jsonModel = model
            }
        }
    }
}

//MARK: - TableView Data Source
extension TopUserViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModelList.count
//        return 100
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier.User) as! TopUserCell
        let index = indexPath.row
        cell.bindModel(cellModelList[index], withIndex: index)
        return cell
    }
}

