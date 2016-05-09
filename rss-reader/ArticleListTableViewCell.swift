//
//  ArticleListTableViewCell.swift
//  rss-reader
//
//  Created by Yuta Tadachi on 2016/05/09.
//  Copyright © 2016年 yuta-t. All rights reserved.
//

import UIKit

class ArticleListTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var img: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        img.contentMode = .ScaleAspectFill
        img.clipsToBounds = true
        title.numberOfLines = 0
        date.textAlignment = .Right
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
