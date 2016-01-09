//
//  HomeCell.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/10.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    
    @IBOutlet weak var iconsImage: UIImageView!
    
    @IBOutlet weak var descTextView: UITextView!
    
    @IBOutlet weak var categoryLabel: UILabel!
   
    @IBOutlet weak var timeLabel: UILabel!
    
    func bindModel(model: HomeCellModel) {
        tag = model.id
        iconsImage.setImageWithId(tag, imagePath: model.pic)
        
        descTextView.text = model.excerpt
        
        switch model.name {
        case "archive":
            categoryLabel.text = "历史精华"
        case "recent":
            categoryLabel.text = "近日热门"
        case "yesterday":
            categoryLabel.text = "昨日最新"
        default:
            break
        }
        
        timeLabel.text = "\(model.date)"
    }
    
}
