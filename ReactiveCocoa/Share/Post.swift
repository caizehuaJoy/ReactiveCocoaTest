//
//  Post.swift
//  RxSwiftMoya
//
//  Created by Chao Li on 9/21/16.
//  Copyright © 2016 ERStone. All rights reserved.
//

import Foundation
import ObjectMapper

class Post: Mappable {
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
