//
//  Protocol.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/17.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

protocol ViewModelType {
    typealias ModelType
    func bindModel(model: ModelType)
}

protocol UserMenuDelegate: class {
    func selectMenuItem(item: UserMenuItem)
}

protocol Refreshable: class {
    func getData()
    var simpleRefreshControl: SimpleRefreshControl { get }
}

extension Refreshable {
    var simpleRefreshControl: SimpleRefreshControl {
        return SimpleRefreshControl { [weak self] in
            self?.getData()
        }
    }
}

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
        
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.CGColor
        }
        get {
            return layer.borderColor != nil ? UIColor(CGColor: layer.borderColor!) : nil
        }
    }
    
}

