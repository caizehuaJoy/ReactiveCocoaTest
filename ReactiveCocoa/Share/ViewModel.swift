//
//  ViewModel.swift
//  RxSwiftMoya
//
//  Created by Chao Li on 9/23/16.
//  Copyright © 2016 ERStone. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class ViewModel {
    private let provider = RxMoyaProvider<QIandaoAPI>()
    
    func getTopicList(programId:String) -> Observable<Post> {
        return provider.request(.getTopicList(programId))
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .mapObject(type:Post.self)
    }
    
  
}
