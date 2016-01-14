//
//  AnswerCell.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/10.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class AnswerCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var authorNameLabel: UILabel!
    
    @IBOutlet weak var voteLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    func bindModel(model: AnswerModel, withIndex index: Int) {
        avatarImageView.setImageWithId(index, imagePath: model.avatar)
        
        authorNameLabel.text = model.authorname
        
        voteLabel.text = "\(model.vote)"
        
        titleLabel.text = model.title
        
        summaryLabel.text = model.summary
    }
}
