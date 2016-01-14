//
//  TopUserCell.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/13.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class TopUserCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var signatureLabel: UILabel!
    
    @IBOutlet weak var agreeLabel: UILabel!
    
    func bindModel(model: TopUserModel, withIndex index: Int) {
        avatarImageView.setImageWithId(index, imagePath: model.avatar)
        
        nameLabel.text = model.name
        
        signatureLabel.text = model.signature
        
        agreeLabel.text = "\(model.agree)"
    }
}
