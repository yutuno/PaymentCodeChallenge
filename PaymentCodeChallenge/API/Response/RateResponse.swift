//
//  RateResponse.swift
//  PaymentCodeChallenge
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import Foundation

struct RateResponse: Decodable {
    let source: String
    let quotes: Quotes
    
    private enum CodingKeys: String, CodingKey {
        case source
        case quotes
    }
}
