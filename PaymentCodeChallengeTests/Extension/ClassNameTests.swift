//
//  ClassNameTests.swift
//  PaymentCodeChallengeTests
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import XCTest
import Nimble
@testable import PaymentCodeChallenge

final class ClassNameTests: XCTestCase {
    func test_Classからクラス名を取得する() {
        expect(HomeVC.className).to(equal("HomeVC"))
    }
}
