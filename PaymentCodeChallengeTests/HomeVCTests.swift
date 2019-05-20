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
    private func homeVC(
        session: SessionProtocol = SessionStub_Success()
        ) -> HomeVC {
        
        return HomeVC(session: session)
    }
    
    func test_collectionViewの背景色はEEEEEE() {
        let subject = homeVC()
        
        
        subject.loadViewIfNeeded()
        
        
        expect(subject.collectionView.backgroundColor)
            .to(equal(UIColor(hex: 0xEEEEEE)))
    }
    
    func test_viewDidLoad画面上にcollectionViewが存在する() {
        let subject = homeVC()
        
        
        subject.loadViewIfNeeded()
        
        
        expect(subject.collectionView).toNot(beNil())
    }
    
    func test_ナビゲーションにタイトルが表示される() {
        let subject = homeVC()
        
        
        subject.loadViewIfNeeded()
        
        
        expect(subject.navigationItem.title).to(equal("為替レート"))
    }
    
    func test_セルは6個表示される() {
        let subject = homeVC()
        
        
        subject.loadViewIfNeeded()
        
        
        expect(subject.collectionView.numberOfItems(inSection: 0))
            .to(equal(6))
    }
    
    func test_為替レートのセルが正しく表示される() {
        let subject = homeVC(
            session: SessionStub_Success()
        )
        
        
        subject.loadViewIfNeeded()
        
        
        expect(subject.collectionView.numberOfItems(inSection: 0))
            .toEventually(equal(6))
        
        expect(subject.getCell(item: 0).findLabel(with: "USD"))
            .toNot(beNil())
        expect(subject.getCell(item: 0).findLabel(with: "1.0"))
            .toNot(beNil())
        
        expect(subject.getCell(item: 1).findLabel(with: "JPY"))
            .toNot(beNil())
        expect(subject.getCell(item: 1).findLabel(with: "110.187001"))
            .toNot(beNil())
        
        expect(subject.getCell(item: 2).findLabel(with: "EUR"))
            .toNot(beNil())
        expect(subject.getCell(item: 2).findLabel(with: "0.89622"))
            .toNot(beNil())
    }
    
    func test_通貨変更ボタンが表示される() {
        let subject = homeVC(
            session: SessionStub_Success()
        )
        
        
        subject.loadViewIfNeeded()
        
        
        expect(subject.view.findButton(with: "通貨変更")).toNot(beNil())
    }
}

private extension HomeVC {
    func getCell(item: Int, section: Int = 0) -> UICollectionViewCell {
        return collectionView.dataSource!.collectionView(
            collectionView,
            cellForItemAt: IndexPath(item: item, section: section)
        )
    }
}
