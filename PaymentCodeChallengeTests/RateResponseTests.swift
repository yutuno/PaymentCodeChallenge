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
    func test_基準通貨がUSD_正常なJSONデータでDecodeした場合_正しくdecodeされる() {
        let subject = try? JSONDecoder().decode(
            RateResponse<USD>.self,
            from: Response.data()
        )
        
        
        expect(subject?.source.code).to(equal("USD"))
        
        expect(subject?.quotes.usd).to(equal(1))
        expect(subject?.quotes.jpy).to(equal(110.187001))
        expect(subject?.quotes.eur).to(equal(0.89622))
        expect(subject?.quotes.aud).to(equal(1.443515))
        expect(subject?.quotes.gbp).to(equal(0.78523))
        expect(subject?.quotes.pln).to(equal(3.85425))
    }
    
    func test_基準通貨がUSD_sourceがないJSONデータでDecodeした場合_正しくdecodeされない() {
        let subject = try? JSONDecoder().decode(
            RateResponse<USD>.self,
            from: Response.data(hasSource: false)
        )
        
        
        expect(subject).to(beNil())
    }
    
    func test_基準通貨がUSD_keyが不正なJSONデータでDecodeした場合_正しくdecodeされない() {
        let subject = try? JSONDecoder().decode(
            RateResponse<USD>.self,
            from: Response.data(source: .jpy)
        )
        
        
        expect(subject).to(beNil())
    }
}
