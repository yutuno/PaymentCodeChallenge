//
//  RateResponseTests.swift
//  PaymentCodeChallengeTests
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import XCTest
import Nimble
@testable import PaymentCodeChallenge

final class RateResponseTests: XCTestCase {}

// MARK: - JSON Decode
extension RateResponseTests {
    func test_正常にDecodeされる() {
        let subject = try? JSONDecoder().decode(
            RateResponse.self,
            from: Response.data()
        )
        
        
        expect(subject?.source).to(equal("USD"))
    }
}
