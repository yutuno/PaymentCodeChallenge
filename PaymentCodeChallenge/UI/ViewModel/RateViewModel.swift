//
//  RateViewModel.swift
//  PaymentCodeChallenge
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import Foundation

struct RateViewModel {
    let source: Currency
    let rates: [Rate]
}

struct Rate {
    let currency: Currency
    let rate: Double
}
