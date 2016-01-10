//
//  HomeCell.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/10.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    
    @IBOutlet weak var avatarsImageView: UIImageView!
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
   
    @IBOutlet weak var timeLabel: UILabel!
    
    let categoryDict = [
        "archive": "历史精华",
        "recent": "近日热门",
        "yesterday": "昨日最新"
    ]
    
    func bindModel(model: HomeCellModel) {
        tag = model.id
        avatarsImageView.setImageWithId(tag, imagePath: model.pic)
        
        summaryLabel.text = model.excerpt
        
        categoryLabel.text = categoryDict[model.name]
        
        timeLabel.text = "\(model.date)"
    }
    
}
