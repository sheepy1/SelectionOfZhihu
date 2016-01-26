//
//  TopUserCell.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/13.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class TopUserCell: UITableViewCell, ViewModelType {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var signatureLabel: UILabel!
    
    @IBOutlet weak var itemLabel: UILabel!
   
    @IBOutlet weak var numberLabel: UILabel!
    
    typealias ModelType = (user: TopUserModel, index: Int)
    
    func bindModel(model: ModelType) {
        let user = model.user
        let index = model.index
        
        avatarImageView.setImageWithId(index, imagePath: user.avatar)
        
        nameLabel.text = user.name
        
        signatureLabel.text = user.signature
        
        if user.agree > 0 {
            numberLabel.text = "\(user.agree)"
            
            itemLabel.text = SortOrderItem.Agree.associatedValue.desc
        } else if user.follower > 0 {
            numberLabel.text = "\(user.follower)"
            itemLabel.text = SortOrderItem.Follower.associatedValue.desc
        }
    }
    
}
