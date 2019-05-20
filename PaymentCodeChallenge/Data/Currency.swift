//
//  Currency.swift
//  PaymentCodeChallenge
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import Foundation

enum Currency: CaseIterable {
    case usd
    case jpy
    case eur
    case aud
    case gbp
    case pln
    
    var code: String {
        switch self {
        case .usd: return "USD"
        case .jpy: return "JPY"
        case .eur: return "EUR"
        case .aud: return "AUD"
        case .gbp: return "GBP"
        case .pln: return "PLN"
        }
    }
    
    var info: (country: String, jpUnit: String) {
        switch self {
        case .usd: return (country: "アメリカ", jpUnit: "米ドル")
        case .jpy: return (country: "日本", jpUnit: "円")
        case .eur: return (country: "欧州", jpUnit: "ユーロ")
        case .aud: return (country: "オーストラリア", jpUnit: "豪ドル")
        case .gbp: return (country: "イギリス", jpUnit: "ポンド")
        case .pln: return (country: "ポーランド", jpUnit: "ズウォティ")
        }
    }
}
