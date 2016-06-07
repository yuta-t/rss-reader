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
    let date: String
    let imageURL: String
    
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
                    date = item.firstChild(css: "dc:date"),
                    imageURL = item.getImageFromJin() else { continue }
                
                let article = Article(title: title.stringValue,
                    url: url.stringValue,
                    date: NSDate.convert(date.stringValue),
                    imageURL: imageURL)
                articles.append(article)
            }
        }
        return articles
    }
}

extension XMLElement {
    func getImageFromJin() -> String? {
        guard let content = self.firstChild(css: "content:encoded") else {
            return nil
        }
        
        let html = try? HTMLDocument(string: content.stringValue, encoding: NSUTF8StringEncoding)
        
        return html?.firstChild(xpath: "//body/div/img")?.attr("src")
    }
}
