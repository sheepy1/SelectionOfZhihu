//
//  UserDetailViewController.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/20.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {

    var userInfo: UserInfo!
    
    var userHash: String! {
        didSet {
            let url = API.UserDetail + userHash
            getDataFromUrl(url, method: .GET, parameter: nil) { data in
                if let jsonData = data, userInfo = jsonData => UserInfo.self {
                    self.userInfo = userInfo
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

}
