//
//  HomeVCTests.swift
//  PaymentCodeChallengeTests
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import XCTest
import Nimble
@testable import PaymentCodeChallenge

final class HomeVCTests: XCTestCase {
    func test_viewDidLoad画面上にcollectionViewが存在する() {
        let subject = HomeVC()
        
        
        subject.loadViewIfNeeded()
        
        
        expect(subject.collectionView).toNot(beNil())
    }
}
