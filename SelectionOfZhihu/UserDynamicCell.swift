//
//  UserDynamicCell.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/24.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class UserDynamicCell: UITableViewCell, ViewModelType {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var agreeLabel: UILabel!
    
    @IBOutlet weak var followerLabel: UILabel!
    
    typealias ModelType = (name: String, avatar: String, dynamicInfo: UserDynamic)
    
    var hasUserInfo = false
    
    func bindModel(model: ModelType) {
        let dynamicInfo = model.dynamicInfo
        dateLabel.text = "· " + dynamicInfo.date
        answerLabel.text = "\(dynamicInfo.answer)篇"
        agreeLabel.text = "\(dynamicInfo.agree)个"
        followerLabel.text = "\(dynamicInfo.follower)个"
        
        if hasUserInfo { return }
        
        usernameLabel.text = model.name
        avatarImageView.setImageWithId(0, imagePath: model.avatar)
        
        hasUserInfo = true
    }
}
