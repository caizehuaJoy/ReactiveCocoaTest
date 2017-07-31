//
//  UploadModel.swift
//  ReactiveCocoa
//
//  Created by 蔡泽华 on 2017/7/29.
//  Copyright © 2017年 蔡泽华. All rights reserved.
//

import UIKit
import Moya
import RxSwift

class UploadModel {
    private let provider = RxMoyaProvider<Giphy>()
    
    func upload(gif: Data) -> Observable<ResultCC> {
       
//        GiphyProvider.request(.upload(gif: data),
//                              callbackQueue: DispatchQueue.main,
//                              progress: progressClosure,
//                              completion: progressCompletionClosure)
       // return provider.requestWithProgress(.upload(gif: gif)) ;
        //return provider.request(.upload(gif:gif) )
        
      return  provider.request(.upload(gif: gif))
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .mapObject(type:ResultCC.self)
        
    }
}
