//
//  CodingKeyMapper.swift
//  PaymentCodeChallenge
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import Foundation

protocol CodingKeyMapper {
    static var source: String { get }
    static var mapper: [String: Quotes<Self>.CodingKeys] { get }
}
extension CodingKeyMapper {
    static var mapper: [String: Quotes<Self>.CodingKeys] { return [:] }
    
    static func key(_ stringValue: String) -> Quotes<Self>.CodingKeys? {
        return mapper[stringValue]
    }
    static func stringValue(_ key: Quotes<Self>.CodingKeys) -> String {
        return mapper.first { $0.value == key }?.key ?? String(describing: key)
    }
}
