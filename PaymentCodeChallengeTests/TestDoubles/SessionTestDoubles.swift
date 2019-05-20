//
//  SessionTestDoubles.swift
//  PaymentCodeChallengeTests
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import XCTest
@testable import PaymentCodeChallenge

final class SessionStub_Success: SessionProtocol {
    @discardableResult
    func send<T: Request>(
        _ request: T,
        completion: @escaping (Result<T.Response, Error>) -> Void
        ) -> URLSessionTask? {
        
        let object = try! JSONDecoder().decode(
            T.Response.self,
            from: Response.data()
        )
        completion(.success(object))
        
        return nil
    }
}
