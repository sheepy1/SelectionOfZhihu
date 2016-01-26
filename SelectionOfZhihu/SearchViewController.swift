//
//  SearchViewController.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/25.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var keyword: String! {
        didSet {
            getData()
        }
    }
    
    var userList: [TopUserModel]! {
        didSet {
            tableView.reloadData()
        }
    }
    
    var cellCount = 0
    
    func getData() {
        let url = API.SearchUser + keyword.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        getDataFromUrl(url, method: .GET, parameter: nil) { data in
            if let jsonData = data, resultModel = jsonData => SearchResultModel.self {
                self.cellCount = resultModel.count
                self.userList = resultModel.users.flatMap {
                    $0 => TopUserModel.self
                }
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let userDetailController = segue.destinationViewController as? UserDetailViewController, index = tableView.indexPathForSelectedRow?.row {
            userDetailController.userHash = userList[index].userHash
            
            //确保滑动返回依旧可用
            navigationController!.interactivePopGestureRecognizer!.delegate = nil;
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        searchBar.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - TableView Data Source
extension SearchViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier.SearchedUser, forIndexPath: indexPath) as! SearchedUserCell
        
        let index = indexPath.row
        cell.bindModel((userList[index], index))
        
        return cell
    }
}

// MARK: - TextFieldDelegate
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if let text = searchBar.text {
            keyword = text
        }
        
        searchBar.resignFirstResponder()
    }
}
