//
//  ArticleListViewController.swift
//  rss-reader
//
//  Created by Yuta Tadachi on 2016/05/05.
//  Copyright © 2016年 yuta-t. All rights reserved.
//

import UIKit
import Bond
import Kingfisher

class ArticleListViewController: UIViewController, UITableViewDelegate {
    let vm = ArticleListViewModel()
    
    override func loadView() {
        super.loadView()
        view = ArticleListView()
        title = "最新記事"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = self.view as! ArticleListView
        view.table.delegate = self
     
        vm.articles.bindTo(view.table, proxyDataSource: vm.proxy) { (indexPath, data, table) -> UITableViewCell in
            let cell = table.dequeueReusableCellWithIdentifier("ArticleListTableViewCell") as! ArticleListTableViewCell
            let article = data[indexPath.section][indexPath.row]
            
            cell.title.text = article.title
            cell.date.text = article.date
            
            cell.img.kf_setImageWithURL(NSURL(string: article.imageURL)!)
            return cell
        }
        
        vm.loadArticles()
        
        view.refreshControl.addTarget(vm,
                                      action: #selector(vm.loadArticles),
                                      forControlEvents: .ValueChanged)
        
        vm.articles.observe { _ in
            view.table.reloadData()
            view.refreshControl.endRefreshing()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let view = self.view as! ArticleListView
        
        if let selectRow = view.table.indexPathForSelectedRow {
            view.table.deselectRowAtIndexPath(selectRow, animated: true)
        }
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.navigationController?.pushViewController(
            SingleArticleViewController(article: vm.articles[indexPath.section][indexPath.row]),
            animated: true)
    }
    
}
