//
//  UIViewController+AlertController.swift
//  PaymentCodeChallenge
//
//  Created by yuto on 2019/05/21.
//  Copyright © 2019 yuto. All rights reserved.
//

import UIKit

extension UIViewController {
    func showActionSheet(completion: @escaping (_ currency: Currency) -> Void) {
        let currencies = Currency.allCases
        
        let actionSheet = UIAlertController(
            title: "通貨変更",
            message: "通貨を変更してください",
            preferredStyle: .actionSheet
        )
        
        for currency in currencies {
            let action = UIAlertAction(
                title: currency.code,
                style: .default
            ) { _ in
                completion(currency)
            }
            actionSheet.addAction(action)
        }
        
        let cancelAction = UIAlertAction(
            title: "キャンセル",
            style: .cancel,
            handler: nil
        )
        actionSheet.addAction(cancelAction)
        
        DispatchQueue.main.async { [weak self] in
            self?.present(actionSheet,
                          animated: true,
                          completion: nil)
        }
    }
}
