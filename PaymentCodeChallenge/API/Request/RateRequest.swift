//
//  RateRequest.swift
//  PaymentCodeChallenge
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import Foundation

struct RateRequest<M: Mapper>: Request {
    typealias Response = RateResponse<M>
    
    let path: String = "/live"
    
    var parameters: [String: String] {
        var params: [String: String] = [
            "access_key": Global.accessKey
        ]
        
        params["source"] = M.source.code
        
        return params
    }
}
