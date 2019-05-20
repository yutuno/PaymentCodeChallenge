//
//  ResponseJSONFixtures.swift
//  PaymentCodeChallengeTests
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import XCTest

typealias Response = ResponseJSONFixtures

struct ResponseJSONFixtures {
    static func data() -> Data {
        return json().data(using: .utf8)!
    }
}

extension ResponseJSONFixtures {
    static func json() -> String {
        return """
        {
            "success": true,
            "terms": "https://currencylayer.com/terms",
            "privacy": "https://currencylayer.com/privacy",
            "timestamp": 1430401802,
            "source": "USD",
            "quotes": {
                "USDAED": 3.672982,
                "USDAFN": 57.8936,
                "USDALL": 126.1652
            }
        }
        """
    }
}
