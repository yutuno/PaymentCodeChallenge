//
//  RateResponse.swift
//  PaymentCodeChallenge
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import Foundation

struct RateResponse: Decodable {
    let source: String
    let quotes: Quotes
    
    private enum CodingKeys: String, CodingKey {
        case source
        case quotes
    }
}

struct Quotes: Codable {
    let usd: Double
    let jpy: Double
    let eur: Double
    let aud: Double
    let gbp: Double
    let pln: Double
    
    enum CodingKeys: String, CodingKey {
        case usd = "USDUSD"
        case jpy = "USDJPY"
        case eur = "USDEUR"
        case aud = "USDAUD"
        case gbp = "USDGBP"
        case pln = "USDPLN"
    }
}
