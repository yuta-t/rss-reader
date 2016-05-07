//
//  Article.swift
//  rss-reader
//
//  Created by Yuta Tadachi on 2016/05/05.
//  Copyright © 2016年 yuta-t. All rights reserved.
//

import Foundation
import Alamofire
import Fuzi
import Bond

struct Article {
    let title: String
    let url: String
    let datetime: String
    
    static func getFromJin() -> ObservableArray<Article> {
        let url = "http://jin115.com/index.rdf"
        let articles: ObservableArray<Article> = []
        
        Alamofire.request(.GET, url)
            .responseData { response in
            guard let data = response.data else { return }
            
            guard let doc = try? XMLDocument(data: data) else { return }
            
            guard let root = doc.root else { return }
            
            for item in root.children(tag: "item") {
                guard let title = item.firstChild(tag: "title"),
                    url = item.firstChild(tag: "link"),
                    datetime = item.firstChild(css: "dc:date") else { return }
                
                let article = Article(title: title.stringValue,
                    url: url.stringValue,
                    datetime: NSDate.convert(datetime.stringValue))
                articles.append(article)
            }
        }
        return articles
    }
}
