//
//  Quotes.swift
//  PaymentCodeChallenge
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import Foundation

struct Quotes<M: Mapper>: Codable {
    let usd: Double
    let jpy: Double
    let eur: Double
    let aud: Double
    let gbp: Double
    let pln: Double
    
    enum CodingKeys: String, CodingKey {
        case usd
        case jpy
        case eur
        case aud
        case gbp
        case pln
        
        init?(stringValue: String) {
            guard let key = key(stringValue) else { return nil }
            self = key
        }
        
        var stringValue: String {
            return string(self)
        }
    }
    
    static var mapper: [String: CodingKeys] {
        return [
            "\(M.source.code)USD": .usd,
            "\(M.source.code)JPY": .jpy,
            "\(M.source.code)EUR": .eur,
            "\(M.source.code)AUD": .aud,
            "\(M.source.code)GBP": .gbp,
            "\(M.source.code)PLN": .pln
        ]
    }
    
    static func key(_ stringValue: String) -> CodingKeys? {
        return mapper[stringValue]
    }
    
    static func string(_ key: CodingKeys) -> String {
        return mapper.first { $0.value == key }?.key ?? String(describing: key)
    }
}
