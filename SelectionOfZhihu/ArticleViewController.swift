//
//  ArticleViewController.swift
//  SelectionOfZhihu
//
//  Created by 杨洋 on 16/1/10.
//  Copyright © 2016年 Sheepy. All rights reserved.
//
import UIKit

//enum ScrollDirection {
//    case Up
//    case Down
//    case None
//}

class ArticleViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    var urlString: String!
    
    var navigationTitle: String! {
        didSet {
            self.navigationItem.title = navigationTitle
        }
    }
    
    //var oldY: CGFloat = 0
    //var newY: CGFloat = 0
    //var scrollDirection: ScrollDirection = .None
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUrl()
    }
    
    func loadUrl() {
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
}

extension ArticleViewController: UIWebViewDelegate {
    
    func webViewDidStartLoad(webView: UIWebView) {
        loadingView.startAnimating()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        loadingView.stopAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        loadingView.stopAnimating()
    }
    
}

//extension ArticleViewController: UIScrollViewDelegate {
//    //判断当前是向上还是向下滑动
//    func scrollViewDidScroll(scrollView: UIScrollView) {
//        newY = scrollView.contentOffset.y
//        if newY > oldY {
//            scrollDirection = .Up
//        } else if oldY > newY {
//            scrollDirection = .Down
//        }
//        oldY = newY
//    }
//}


