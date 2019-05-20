//
//  ResponseJSONFixtures.swift
//  PaymentCodeChallengeTests
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import XCTest
@testable import PaymentCodeChallenge

typealias Response = ResponseJSONFixtures

struct ResponseJSONFixtures {
    static func data(
        hasSource: Bool = true,
        source: Currency = .usd
        ) -> Data {
        
        return JSONFixtures.json(
            hasSource: hasSource,
            source: source
            ).data(using: .utf8)!
    }
}
