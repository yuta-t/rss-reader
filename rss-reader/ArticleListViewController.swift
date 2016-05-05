//
//  ArticleListViewController.swift
//  rss-reader
//
//  Created by Yuta Tadachi on 2016/05/05.
//  Copyright © 2016年 yuta-t. All rights reserved.
//

import UIKit

class ArticleListViewController: UIViewController, UITableViewDelegate {
    let mv = ArticleListViewModel()
    
    override func loadView() {
        super.loadView()
        view = ArticleListView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let articleListView = view as! ArticleListView
        articleListView.table.delegate = self
        articleListView.table.dataSource = mv
    }
}
