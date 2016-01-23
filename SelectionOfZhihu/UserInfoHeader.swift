//
//  UserInfoHead.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/23.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class UserInfoHeader: UITableViewCell, ViewModelType {
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var signatureLabel: UILabel!
    
    @IBOutlet weak var fansAndAgreeLabel: UILabel!
    
    typealias ModelType = (username: String, signature: String, fans: Int, agree: Int)
    
    func bindModel(model: ModelType) {
        usernameLabel.text = model.username
        signatureLabel.text = model.signature
        fansAndAgreeLabel.text = "\(model.fans)个粉丝，获得\(model.agree)个赞同"
    }
   
}
