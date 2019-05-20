//
//  RateResponse.swift
//  PaymentCodeChallenge
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import Foundation

struct RateResponse: Decodable {
    let source: Currency
    let quotes: Quotes
    
    private enum CodingKeys: String, CodingKey {
        case sourceCurrency = "source"
        case quotes
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let code = try container.decode(String.self, forKey: .sourceCurrency)
        
        source = Currency.allCases.filter({ $0.code == code }).first!
        quotes = try container.decode(Quotes.self, forKey: .quotes)
    }
}
