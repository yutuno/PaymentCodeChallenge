//
//  JSONFixtures.swift
//  PaymentCodeChallengeTests
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import XCTest
@testable import PaymentCodeChallenge

struct JSONFixtures {
    static func json(
        hasSource: Bool = true,
        source: Currency = .usd
        ) -> String {
        
        var dictionary: [String: Any] = [
            "success": true,
            "terms": "https://currencylayer.com/terms",
            "privacy": "https://currencylayer.com/privacy",
            "timestamp": 1558335785,
        ]
        
        if hasSource {
            dictionary["source"] = source.code
        }
        
        dictionary["quotes"] = [
            "\(source.code)AUD": source == .aud ? 1 : 1.443515,
            "\(source.code)EUR": source == .eur ? 1 : 0.89622,
            "\(source.code)GBP": source == .gbp ? 1 : 0.78523,
            "\(source.code)JPY": source == .jpy ? 1 : 110.187001,
            "\(source.code)PLN": source == .pln ? 1 : 3.85425,
            "\(source.code)USD": source == .usd ? 1 : 0.009087,
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: [])
            let jsonStr = String(bytes: jsonData, encoding: .utf8)!
            
            return jsonStr
        } catch {
            fatalError()
        }
    }
}
