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
    
    var code: String {
        switch self {
        case .usd: return "USD"
        case .jpy: return "JPY"
        case .eur: return "EUR"
        case .aud: return "AUD"
        }
    }
}
