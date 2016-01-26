//
//  AnswerCell.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/10.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class AnswerCell: UITableViewCell, ViewModelType {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var authorNameLabel: UILabel!
    
    @IBOutlet weak var voteLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    typealias ModelType = (answer: AnswerModel, index: Int)
    
    func bindModel(model: ModelType) {
        let answer = model.answer
        let index = model.index
        
        avatarImageView.setImageWithId(index, imagePath: answer.avatar)
        
        authorNameLabel.text = answer.authorname
        
        voteLabel.text = "\(answer.vote)"
        
        titleLabel.text = answer.title
        
        summaryLabel.text = answer.summary
    }
}
