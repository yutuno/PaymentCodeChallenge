//
//  Request.swift
//  PaymentCodeChallenge
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import Foundation

protocol Request {
    associatedtype Response: Decodable
    var path: String { get }
    var parameters: [String: String] { get }
}

extension Request {
    var baseURL: URL {
        return URL(string: "https://apilayer.net/api")!
    }
}
