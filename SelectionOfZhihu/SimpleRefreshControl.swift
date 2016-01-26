//
//  SimpleRefreshController.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/25.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

class SimpleRefreshControl: UIRefreshControl {
    typealias Action = () -> ()
    
    var action: Action!
    
    init(action: Action) {
        super.init()
        
        self.action = action
        self.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func refresh() {
        self.action()
        delay(seconds: 1) {
            self.endRefreshing()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

