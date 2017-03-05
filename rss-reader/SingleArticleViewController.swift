//
//  SingleArticleViewController.swift
//  rss-reader
//
//  Created by Yuta Tadachi on 2016/05/07.
//  Copyright © 2016年 yuta-t. All rights reserved.
//

import UIKit
import WebKit

class SingleArticleViewController: UIViewController, WKNavigationDelegate {
    let vm: SingleArticleViewModel
    
    init(article: Article) {
        vm = SingleArticleViewModel(article: article)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = SingleArticleView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = self.view as! SingleArticleView
        view.webView.navigationDelegate = self
        title = vm.article.title
        view.webView.loadRequest(NSURLRequest(URL: NSURL(string: vm.article.url)!))
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        print("finish")
        title = webView.title
    }
}
