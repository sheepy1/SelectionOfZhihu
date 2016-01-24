//
//  UserMenu.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/24.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

enum UserMenuItem: Int {
    // rawValue 对应相应的 cellHeight
    case Dynamic = 100
    case Answer = 80
    case More = 0
}

class UserMenu: UITableViewCell {
    
    @IBOutlet weak var dynamicButton: UIButton!
    
    @IBOutlet weak var answerButton: UIButton!
    
    @IBOutlet weak var moreButton: UIButton!
    
    @IBOutlet weak var indicator: UIView!
    
    @IBOutlet weak var indicatorCenterX: NSLayoutConstraint!
    
    lazy var lastSelectedItem: UIButton = {
        return self.dynamicButton
    }()
    
    lazy var selectedColor: UIColor! = {
        return self.dynamicButton.titleColorForState(.Normal)
    }()
    
    let deselectedColor = UIColor.lightGrayColor()
    weak var delegate: UserMenuDelegate?
    func addMenuItemTarget() {
        [dynamicButton, answerButton, moreButton].forEach {
            $0.addTarget(self, action: "selectMenuItem:", forControlEvents: .TouchUpInside)
        }
    }
    
    func selectMenuItem(item: UIButton) {
        //将选中的 item 设为选中色，并将上一次选中的 item 恢复为未选中色
        item.setTitleColor(selectedColor, forState: .Normal)
        lastSelectedItem.setTitleColor(deselectedColor, forState: .Normal)
        lastSelectedItem = item
        
        //改变指示条的约束，使其水平中心点与选中 item 的水平中心点相同
        let newCenterX = NSLayoutConstraint(item: indicator, attribute: .CenterX, relatedBy: .Equal, toItem: item, attribute: .CenterX, multiplier: 1, constant: 0)
        indicatorCenterX.active = false
        indicatorCenterX = newCenterX
        indicatorCenterX.active = true
        
        //通知代理
        delegate?.selectMenuItem(UserMenuItem(rawValue: item.tag)!)
    }

}
