//
//  ArticleListViewModel.swift
//  rss-reader
//
//  Created by Yuta Tadachi on 2016/05/05.
//  Copyright © 2016年 yuta-t. All rights reserved.
//

import UIKit
import Bond

class ArticleListViewModel: NSObject {
    var articles: ObservableArray<ObservableArray<Article>> = []
    let proxy = NoAnimationTableViewProxy()

    func loadArticles() {
        articles.removeAll()
        articles.append(Article.getFromJin())
    }
}

class NoAnimationTableViewProxy: BNDTableViewProxyDataSource {
    @objc func tableView(tableView: UITableView, animationForRowInSections sections: Set<Int>) -> UITableViewRowAnimation {
        return .Fade
    }
    
    @objc func tableView(tableView: UITableView, animationForRowAtIndexPaths indexPaths: [NSIndexPath]) -> UITableViewRowAnimation {
        return .None
    }
}
