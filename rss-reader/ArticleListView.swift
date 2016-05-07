//
//  ArticleListView.swift
//  rss-reader
//
//  Created by Yuta Tadachi on 2016/05/05.
//  Copyright © 2016年 yuta-t. All rights reserved.
//

import UIKit

class ArticleListView: UIView {
    var table: UITableView
    var refreshControl: UIRefreshControl
    
    init() {
        table = UITableView()
        refreshControl = UIRefreshControl()
        
        super.init(frame: CGRectZero)
        addSubview(table)
        table.addSubview(refreshControl)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        table.frame = frame
    }
}
