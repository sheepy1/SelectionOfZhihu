//
//  UserDetailViewController.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/20.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var avatarHeight: NSLayoutConstraint!
    
    @IBOutlet weak var avatarWidth: NSLayoutConstraint!
  
    @IBAction func back(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    typealias CellGetter = (Int) -> UITableViewCell
    
    // 返回具体 cell 的闭包
    var cellForRow: CellGetter!
    
    var cellCount = 0
    
    var selectedIndexPath: NSIndexPath!
    
    var userHash: String! {
        didSet {
            let url = API.UserDetail + userHash
            getDataFromUrl(url, method: .GET, parameter: nil) { data in
                if let jsonData = data, userInfo = jsonData => UserInfoModel.self {
                    self.userInfo = userInfo
                }
            }
        }
    }
    
    var userInfo: UserInfoModel! {
        didSet {
            tableHeader.bindModel((userInfo.name, userInfo.signature, userDetail.follower, userDetail.agree))
            avatarImageView.setImageWithId(0, imagePath: userInfo.avatar)
            
            //默认显示用户动态
            cellCount = userTimeLine.count
            cellForRow = dynamicInfoCellForRow
            tableView.rowHeight = CGFloat(UserMenuItem.Dynamic.rawValue)
            tableView.reloadData()
        }
    }
    
    lazy var userDetail: UserDetailModel! = {
        return self.userInfo.detail => UserDetailModel.self
    }()
    
    lazy var userTimeLine: [UserDynamicModel] = {
        return self.userInfo.trend.flatMap {
            $0 => UserDynamicModel.self
        }
    }()
    
    lazy var topAnswerList: [TopAnswerModel] = {
        return self.userInfo.topanswers.flatMap {
            $0 => TopAnswerModel.self
        }
    }()
    
    lazy var userMenu: UserMenu = {
        let userMenu = self.tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier.UserMenu) as! UserMenu
        userMenu.addMenuItemTarget()
        userMenu.delegate = self
        return userMenu
    }()
    
    lazy var tableHeader: UserInfoHeader = {
        let header = self.tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier.UserInfo) as! UserInfoHeader
        return header
    }()
    
    lazy var avatarMaxRadius: CGFloat = {
        return self.avatarHeight.constant
    }()
    
    lazy var avatarMaxCornerRadius: CGFloat = {
        return self.avatarImageView.cornerRadius
    }()
    
    func dynamicInfoCellForRow(row: Int) -> UserDynamicCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier.UserDynamic) as! UserDynamicCell
        
        cell.bindModel((userInfo.name, userInfo.avatar, userTimeLine[row]))
        return cell
    }
    
    func topAnswerCellForRow(row: Int) -> TopAnswerCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier.TopAnswer) as! TopAnswerCell
        
        cell.bindModel(topAnswerList[row])
        return cell
    }
    
    func layoutAvatarImmediately() {
        avatarHeight.active = true
        avatarWidth.active = true
    }
    
    func getAnswerUrlWithLink(link: String, isPost: String) -> String {
        switch isPost {
        case "1":
            return API.ZhuanlanHost + link
        default: 
            return API.ArticleHost + link
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let answerControlelr = segue.destinationViewController as? ArticleViewController, index = tableView.indexPathForSelectedRow?.row {
            selectedIndexPath = NSIndexPath(forRow: index, inSection: 0)
            let answer = topAnswerList[index]
            answerControlelr.urlString = getAnswerUrlWithLink(answer.link, isPost: answer.ispost)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableHeaderView = tableHeader

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
        if let indexPath = selectedIndexPath {
            tableView.deselectRowAtIndexPath(indexPath, animated: animated)
        }
    }
}

// MARK: - TableView Data Source
extension UserDetailViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return cellForRow(indexPath.row)
    }
}

// MARK: - TableView Delegate
extension UserDetailViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return userMenu
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    //头像随页面滑动改变大小
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let headerHeight = tableHeader.frame.height
        guard offsetY < headerHeight else {
            avatarHeight.constant = avatarMaxRadius/2
            avatarWidth.constant = avatarMaxRadius/2
            avatarImageView.cornerRadius = avatarMaxCornerRadius/2
            return
        }
        
        let multiplier = offsetY/headerHeight
        //外接矩形最终长宽都减一半
        avatarHeight.constant = avatarMaxRadius - avatarMaxRadius/2 * multiplier
        avatarWidth.constant = avatarHeight.constant
        layoutAvatarImmediately()
        //圆角半径最终减一半
        avatarImageView.cornerRadius = avatarMaxCornerRadius - avatarMaxCornerRadius/2 * multiplier
    }
}

// MARK: - UserMenuDelegate
extension UserDetailViewController: UserMenuDelegate {
    func selectMenuItem(item: UserMenuItem) {
        guard userInfo != nil else { return }
        
        switch item {
        case .Dynamic:
            cellCount = userTimeLine.count
            cellForRow = dynamicInfoCellForRow
            tableView.separatorStyle = .None
        case .Answer:
            cellCount = topAnswerList.count
            cellForRow = topAnswerCellForRow
            tableView.separatorStyle = .SingleLine
        case .More:
            cellCount = 0
        }
        tableView.rowHeight = CGFloat(item.rawValue)
        tableView.reloadData()
    }
    
    func showMoreDetail() {
        
    }
}

