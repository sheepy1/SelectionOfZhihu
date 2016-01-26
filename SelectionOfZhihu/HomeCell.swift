//
//  HomeCell.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/10.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell, ViewModelType {
    
    @IBOutlet weak var avatarsImageView: UIImageView!
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
   
    @IBOutlet weak var timeLabel: UILabel!
    
    typealias ModelType = (article: HomeCellModel, index: Int)
    
    func bindModel(model: ModelType) {
        let article = model.article
        let index = model.index
        
        avatarsImageView.setImageWithId(index, imagePath: article.pic)
        
        summaryLabel.text = article.excerpt
        
        categoryLabel.text = ArticleCagetory.categoryDict[article.name]
       
        timeLabel.text = article.date
    }
    
}
