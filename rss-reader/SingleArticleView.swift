//
//  SingleArticleView.swift
//  rss-reader
//
//  Created by Yuta Tadachi on 2016/05/07.
//  Copyright © 2016年 yuta-t. All rights reserved.
//

import UIKit
import WebKit

class SingleArticleView: UIView {
    var webView: WKWebView
    
    init() {
        webView = WKWebView()
        
        super.init(frame: CGRectZero)
        addSubview(webView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        webView.frame = frame
    }
}
