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

    func loadArticles() {
        articles.append(Article.getFromJin())
    }
}
