//
//  ArticleListViewController.swift
//  rss-reader
//
//  Created by Yuta Tadachi on 2016/05/05.
//  Copyright © 2016年 yuta-t. All rights reserved.
//

import UIKit
import Bond

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
        
        mv.articles.bindTo(articleListView.table) { (indexPath, data, table) -> UITableViewCell in
            let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "cell")
            let article = data[indexPath.section][indexPath.row]
            cell.textLabel?.text = article.title
            cell.detailTextLabel?.text = article.datetime
            return cell
        }
        
        mv.loadArticles()
        
        articleListView.refreshControl.addTarget(mv,
                                                 action: #selector(mv.loadArticles),
                                                 forControlEvents: .ValueChanged)
        
        mv.articles.observe { _ in
            articleListView.refreshControl.endRefreshing()
        }
    }

}
