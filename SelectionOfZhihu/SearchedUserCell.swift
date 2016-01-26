//
//  SearchedUserCell.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/26.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class SearchedUserCell: UITableViewCell, ViewModelType {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var signatureLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var agreeLabel: UILabel!
    
    @IBOutlet weak var followerLabel: UILabel!
    
    typealias ModelType = (user: TopUserModel, index: Int)
    
    func bindModel(model: ModelType) {
        let user = model.user
        avatarImageView.setImageWithId(model.index, imagePath: user.avatar)
        
        nameLabel.text = user.name
        signatureLabel.text = user.signature
        answerLabel.text = "\(user.answer)"
        agreeLabel.text = "\(user.agree)"
        followerLabel.text = "\(user.follower)"
    }
}
