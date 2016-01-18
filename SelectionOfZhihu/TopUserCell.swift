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
    
    @IBOutlet weak var agreeLabel: UILabel!
    
    func bindModel(model: TopUserModel) {
        nameLabel.text = model.name
        
        signatureLabel.text = model.signature
        
        agreeLabel.text = "\(model.agree)"
    }
    
    func bindModel(model: TopUserModel, withImageIndex index: Int) {
        avatarImageView.setImageWithId(index, imagePath: model.avatar)
        
        bindModel(model)
    }
    
//    func bindModel(model: JSON, withIndex index: Int) {
//        avatarImageView.setImageWithId(index, imagePath: model["avatar"].stringValue)
//        
//        nameLabel.text = model["name"].stringValue
//        
//        signatureLabel.text = model["signature"].stringValue
//        
//        agreeLabel.text = "\(model["agree"].intValue)"
//    }
}
