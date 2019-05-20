//
//  RateRequest.swift
//  PaymentCodeChallenge
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import Foundation

struct RateRequest: Request {
    typealias Response = RateResponse
    
    let path: String = "/live"
    
    var parameters: [String: String] {
        var params: [String: String] = [
            "access_key": Global.accessKey
        ]
        
        params["source"] = "USD"
        
        return params
    }
}
