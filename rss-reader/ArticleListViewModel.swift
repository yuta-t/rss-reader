//
//  ArticleListViewModel.swift
//  rss-reader
//
//  Created by Yuta Tadachi on 2016/05/05.
//  Copyright © 2016年 yuta-t. All rights reserved.
//

import UIKit

class ArticleListViewModel: NSObject, UITableViewDataSource {
    let articles: [Article] = []
    
    func loadArticles() {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        return cell
    }
}