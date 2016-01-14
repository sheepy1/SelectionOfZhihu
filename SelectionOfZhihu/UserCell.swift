//
//  UserCell.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/14.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    var avatarImageView: UIImageView!
    
    var nameLabel: UILabel!
    
    var signatureLabel: UILabel!
    
    var followImageView: UIImageView!
    
    var followCount: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        avatarImageView = UIImageView(frame: CGRect(x: 8, y: 8, width: 80, height: 80))
        
        nameLabel = UILabel(frame: CGRect(x: 100, y: 8, width: 200, height: 30))
        
        signatureLabel = UILabel(frame: CGRect(x: 100, y: 40, width: 300, height: 30))
        
        followImageView = UIImageView(frame: CGRect(x: 300, y: 8, width: 10, height: 10))
        followImageView.image = UIImage(named: "agree")
        
        followCount = UILabel(frame: CGRect(x: 320, y: 8, width: 50, height: 20))
        
        [avatarImageView, nameLabel, signatureLabel, followImageView, followCount].forEach {
            addSubview($0)
        }
    }
    
    func bindModel(model: TopUserModel, withIndex index: Int) {
        avatarImageView.setImageWithId(index, imagePath: model.avatar)
        
        nameLabel.text = model.name
        
        signatureLabel.text = model.signature
        
        followCount.text = "\(model.agree)"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
