//
//  ImageDownloadHelper.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/10.
//  Copyright © 2016年 Sheepy. All rights reserved.
//

import UIKit

//图片缓存
private let queue = dispatch_queue_create("load_image", DISPATCH_QUEUE_CONCURRENT)
private let localImage = UIImage(named: "default_img")
private let imageCache = NSCache()
func loadImageFrom(imagePath: String,flag: Int = -1, completion: (image: UIImage!, flag: Int) -> Void) {
    var image: UIImage?
    guard !imagePath.isEmpty else {
        return
    }
    
    let imageUrl = imagePath
    
    if let imageData = imageCache.objectForKey(imageUrl) as? NSData {
        //printLog("cache")
        image = UIImage(data: imageData)
        completion(image: image, flag: flag)
    } else {
        dispatch_async(queue) {
            guard let url = NSURL(string: imageUrl), let data = NSData(contentsOfURL: url) else {
                return
            }
            imageCache.setObject(data, forKey: imageUrl)
            dispatch_async(dispatch_get_main_queue()) {
                completion(image: UIImage(data: data), flag: flag)
            }
        }
    }
}

//防止因Cell重用和异步加载图片引起的图片错位
extension UIImageView {
    
    func setImageWithId(id: Int, imagePath: String, placeholder: UIImage? = localImage) {
        //设置默认图片,清除因复用而存在的图片
        if let defaultImage = placeholder {
            self.image = defaultImage
        }
        self.tag = id
        loadImageFrom(imagePath, flag: id) { image, flag in
            //imagePath是被捕获的自由变量，其指针指向最新的值
            if flag == self.tag {
                self.image = image
            }
        }
    }
}
