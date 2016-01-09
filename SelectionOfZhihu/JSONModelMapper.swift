//
//  JSONModelMapper.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 15/12/23.
//  Copyright © 2015年 Sheepy. All rights reserved.
//

import Foundation

enum ConvertError: ErrorType {
    case InvalidJSON(errorMessage: String)
}

extension NSData {
    func convertToModel<T: NSObject>() -> T? {
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(self, options: NSJSONReadingOptions.MutableContainers)
            let model = json => T.self
            return model
        } catch {
            print("JSONSerializationError: \(error)")
            return nil
        }
    }
}

extension Dictionary {
    func convertToModel<T: NSObject>() -> T {
        let model = T()
        let mirror = Mirror(reflecting: model)
        
        mirror.children.forEach {
            if let key = $0.0 as? Key, value = self[key] {
                model.setValue(value as? AnyObject, forKey: $0.0!)
            }
        }
        
        return model
    }
}

extension NSObject {
    func convertToDictinary() -> [String: AnyObject] {
        var dict = [String: AnyObject]()
        let mirror = Mirror(reflecting: self)
        
        mirror.children.forEach {
            dict[$0.0!] = $0.1 as? AnyObject
        }
        
        return dict
    }
    
    func convertToData() -> NSData? {
        do {
            let data = try NSJSONSerialization.dataWithJSONObject(self.convertToDictinary(), options: NSJSONWritingOptions.init(rawValue: 0))
            return data
        } catch {
            print("JSONSerializationError: \(error)")
            return nil
        }
    }
}

infix operator => {
    precedence 160
}

func =><T: NSObject>(lhs: NSData, rhs: T.Type) -> T? {
    let model: T? = lhs.convertToModel()
    return model
}

func =><T: NSObject>(lhs: AnyObject, rhs: T.Type) -> T? {
    guard let dict = lhs as? [String: AnyObject] else {
        print("Can't convert \(lhs) to [String: AnyObject].")
        return nil
    }
    
    let model: T = dict.convertToModel()
    return model
}
