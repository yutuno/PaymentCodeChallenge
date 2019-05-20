//
//  HomeVC.swift
//  PaymentCodeChallenge
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import UIKit

final class HomeVC: UIViewController {
    @IBOutlet private(set) weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: 後ほど修正
        Session().send(RateRequest()) { (result) in
            print("🐹 \(result)")
        }
    }
}
