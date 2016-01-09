//
//  HTTPManager.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 15/12/23.
//  Copyright © 2015年 Sheepy. All rights reserved.
//

import Foundation

//enum HTTPError: ErrorType {
//    case InvalidURL
//    case NoParameter
//}

enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

typealias CompletionHandler = (data: NSData?, error: NSError?) -> ()

func getDataFromUrl(urlString: String, method: HTTPMethod, parameter: [String: AnyObject]?, completionHandler: CompletionHandler) -> NSURLSessionDataTask? {
    guard let url = NSURL(string: urlString) else {
        print("URL error: \(urlString)")
        return nil
    }
    
    let session = NSURLSession.sharedSession()
    let request = NSMutableURLRequest(URL: url)
    request.HTTPMethod = method.rawValue
    
    switch method {
    case .POST, .PUT:
        if let param = parameter {
            request.HTTPBody = try? NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions.init(rawValue: 0))
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
    default:
        break
    }
    
    let task = session.dataTaskWithRequest(request) {data, response, error in
        //NSSession会默认开启一个后台队列，所以UI操作要调度回主队列进行。
        dispatch_async(dispatch_get_main_queue()) {
            completionHandler(data: data, error: error)
        }
    }
    //启动
    task.resume()
    return task
    
}

