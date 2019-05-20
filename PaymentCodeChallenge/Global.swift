//
//  Global.swift
//  PaymentCodeChallenge
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import UIKit

struct Global {
    static var isUnitTest: Bool {
        return ProcessInfo.processInfo.environment["isUnitTest"] == "true"
    }
}
