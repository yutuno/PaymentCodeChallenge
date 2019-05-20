//
//  UIView+Find.swift
//  PaymentCodeChallengeTests
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import XCTest

extension UIView {
    func findLabel(with text: String) -> UILabel? {
        return findSubviews { (subview: UILabel) -> Bool in
            subview.text == text
        }.first
    }
    
    func findSubviews<T: UIView>(with condition: (T) -> Bool) -> [T] {
        return subviews.flatMap { subview -> [T] in
            var result: [T] = subview.findSubviews(with: condition)
            if let view = subview as? T {
                result.append(view)
            }
            return result
        }.filter(condition)
    }
}
