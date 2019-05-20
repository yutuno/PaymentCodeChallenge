//
//  CurrencyTests.swift
//  PaymentCodeChallengeTests
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import XCTest
import Nimble
@testable import PaymentCodeChallenge

final class CurrencyTests: XCTestCase {
    func test_管理している通貨の合計種類は6種類() {
        expect(Currency.allCases.count).to(equal(6))
    }
    
    func test_通貨コードが正しい() {
        expect(Currency.usd.code).to(equal("USD"))
        expect(Currency.jpy.code).to(equal("JPY"))
        expect(Currency.eur.code).to(equal("EUR"))
        expect(Currency.aud.code).to(equal("AUD"))
        expect(Currency.gbp.code).to(equal("GBP"))
        expect(Currency.pln.code).to(equal("PLN"))
    }
}
