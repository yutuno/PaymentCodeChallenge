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
        let subject = RateRequest<USD>()
        
        
        expect(subject.baseURL.absoluteString)
            .to(equal("https://apilayer.net/api"))
    }
    
    func test_pathがliveとなる() {
        let subject = RateRequest<USD>()
        
        
        expect(subject.path).to(equal("/live"))
    }
    
    func test_リクエストパラメータのaccess_keyが正しい() {
        let subject = RateRequest<USD>()
        
        
        expect(subject.parameters["access_key"])
            .to(equal("45531adb1d125b1ec652f80f2b2f0de3"))
    }
    
    func test_基準通貨がUSDの場合_リクエストパラメータのsourceがUSD() {
        let subject = RateRequest<USD>()
        
        
        expect(subject.parameters["source"]).to(equal("USD"))
    }
    
    func test_基準通貨がJPYの場合_リクエストパラメータのsourceがJPY() {
        let subject = RateRequest<JPY>()
        
        
        expect(subject.parameters["source"]).to(equal("JPY"))
    }
    
    func test_基準通貨がEURの場合_リクエストパラメータのsourceがEUR() {
        let subject = RateRequest<EUR>()
        
        
        expect(subject.parameters["source"]).to(equal("EUR"))
    }
    
    func test_基準通貨がAUDの場合_リクエストパラメータのsourceがAUD() {
        let subject = RateRequest<AUD>()
        
        
        expect(subject.parameters["source"]).to(equal("AUD"))
    }
    
    func test_基準通貨がGBPの場合_リクエストパラメータのsourceがGBP() {
        let subject = RateRequest<GBP>()
        
        
        expect(subject.parameters["source"]).to(equal("GBP"))
    }
    
    func test_基準通貨がPLNの場合_リクエストパラメータのsourceがPLN() {
        let subject = RateRequest<PLN>()
        
        
        expect(subject.parameters["source"]).to(equal("PLN"))
    }
}
