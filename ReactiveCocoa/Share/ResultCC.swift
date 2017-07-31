//
//  ResultCC.swift
//  ReactiveCocoa
//
//  Created by 蔡泽华 on 2017/7/29.
//  Copyright © 2017年 蔡泽华. All rights reserved.
//

import UIKit
import ObjectMapper

class ResultCC: Mappable{
    var code: String?
    var message: String? = ""
    var meta: String? = ""
    var data: Array<Any>?
    
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        data <- map["data"]
        meta <- map["meta"]
        
    }
}
