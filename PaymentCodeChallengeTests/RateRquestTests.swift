//
//  RateRquestTests.swift
//  PaymentCodeChallengeTests
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import XCTest
import Nimble
@testable import PaymentCodeChallenge

final class RateRquestTests: XCTestCase {}

// MARK: - リクエストURL
extension RateRquestTests {
    func test_ホストURLが正しい() {
        let subject = RateRequest()
        
        
        expect(subject.baseURL.absoluteString)
            .to(equal("https://apilayer.net/api"))
    }
    
    func test_pathがliveとなる() {
        let subject = RateRequest()
        
        
        expect(subject.path).to(equal("/live"))
    }
    
    func test_パラメータが正しい() {
        let subject = RateRequest()
        
        
        expect(subject.parameters["access_key"])
            .to(equal("45531adb1d125b1ec652f80f2b2f0de3"))
        expect(subject.parameters["source"]).to(equal("USD"))
    }
}
