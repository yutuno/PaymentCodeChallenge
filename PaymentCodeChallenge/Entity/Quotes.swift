//
//  Quotes.swift
//  PaymentCodeChallenge
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import Foundation

struct Quotes<Mapper: CodingKeyMapper>: Codable {
    let usd: Double
    let jpy: Double
    let eur: Double
    let aud: Double
    let gbp: Double
    let pln: Double
    
    enum CodingKeys: String, CodingKey {
        case usd
        case jpy
        case eur
        case aud
        case gbp
        case pln
        
        init?(stringValue: String) {
            guard let k = Mapper.key(stringValue) else { return nil }
            self = k
        }
        var stringValue: String {
            return Mapper.stringValue(self)
        }
    }
}

struct USD: CodingKeyMapper {
    static let source = "USD"
    static let mapper: [String: Quotes<USD>.CodingKeys] = [
        "\(source)USD": .usd,
        "\(source)JPY": .jpy,
        "\(source)EUR": .eur,
        "\(source)AUD": .aud,
        "\(source)GBP": .gbp,
        "\(source)PLN": .pln
    ]
}

struct JPY: CodingKeyMapper {
    static let source = "JPY"
    static let mapper: [String: Quotes<JPY>.CodingKeys] = [
        "\(source)USD": .usd,
        "\(source)JPY": .jpy,
        "\(source)EUR": .eur,
        "\(source)AUD": .aud,
        "\(source)GBP": .gbp,
        "\(source)PLN": .pln
    ]
}

struct EUR: CodingKeyMapper {
    static let source = "EUR"
    static let mapper: [String: Quotes<EUR>.CodingKeys] = [
        "\(source)USD": .usd,
        "\(source)JPY": .jpy,
        "\(source)EUR": .eur,
        "\(source)AUD": .aud,
        "\(source)GBP": .gbp,
        "\(source)PLN": .pln
    ]
}

struct AUD: CodingKeyMapper {
    static let source = "AUD"
    static let mapper: [String: Quotes<AUD>.CodingKeys] = [
        "\(source)USD": .usd,
        "\(source)JPY": .jpy,
        "\(source)EUR": .eur,
        "\(source)AUD": .aud,
        "\(source)GBP": .gbp,
        "\(source)PLN": .pln
    ]
}

struct GBP: CodingKeyMapper {
    static let source = "GBP"
    static let mapper: [String: Quotes<GBP>.CodingKeys] = [
        "\(source)USD": .usd,
        "\(source)JPY": .jpy,
        "\(source)EUR": .eur,
        "\(source)AUD": .aud,
        "\(source)GBP": .gbp,
        "\(source)PLN": .pln
    ]
}

struct PLN: CodingKeyMapper {
    static let source = "PLN"
    static let mapper: [String: Quotes<PLN>.CodingKeys] = [
        "\(source)USD": .usd,
        "\(source)JPY": .jpy,
        "\(source)EUR": .eur,
        "\(source)AUD": .aud,
        "\(source)GBP": .gbp,
        "\(source)PLN": .pln
    ]
}
