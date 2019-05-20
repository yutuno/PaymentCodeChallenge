//
//  main.swift
//  PaymentCodeChallenge
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import UIKit

private var appDelegateName: String {
    if Global.isUnitTest {
        return NSStringFromClass(TestAppDelegate.self)
    } else {
        return NSStringFromClass(AppDelegate.self)
    }
}

UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    NSStringFromClass(UIApplication.self),
    appDelegateName
)
