//
//  CurrencyCodingKeyMapper.swift
//  PaymentCodeChallenge
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import Foundation

typealias Mapper = CurrencyCodingKeyMapper
protocol CurrencyCodingKeyMapper {
    static var source: Currency { get }
}
