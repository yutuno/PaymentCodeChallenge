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

struct USD: Mapper {
    static let source: Currency = .usd
}

struct JPY: Mapper {
    static let source: Currency = .jpy
}

struct EUR: Mapper {
    static let source: Currency = .eur
}

struct AUD: Mapper {
    static let source: Currency = .aud
}

struct GBP: Mapper {
    static let source: Currency = .gbp
}

struct PLN: Mapper {
    static let source: Currency = .pln
}
