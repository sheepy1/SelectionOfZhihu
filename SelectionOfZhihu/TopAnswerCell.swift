//
//  TopAnswerCell.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/24.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class TopAnswerCell: UITableViewCell, ViewModelType {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var agreeLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    func bindModel(model: TopAnswerModel) {
        titleLabel.text = model.title
        agreeLabel.text = "\(model.agree)"
        dateLabel.text = model.date
    }
}
