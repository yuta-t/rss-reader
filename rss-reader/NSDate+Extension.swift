//
//  NSDate+Extension.swift
//  rss-reader
//
//  Created by Yuta Tadachi on 2016/05/07.
//  Copyright © 2016年 yuta-t. All rights reserved.
//

import Foundation

extension NSDate {
    class func initWith(string: String) -> NSDate {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZ"
        return formatter.dateFromString(string)!
    }
    
    func convertToString() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "M月d日 HH:mm"
        return formatter.stringFromDate(self)
    }
    
    class func convert(string: String) -> String {
        return initWith(string).convertToString()
    }
}
