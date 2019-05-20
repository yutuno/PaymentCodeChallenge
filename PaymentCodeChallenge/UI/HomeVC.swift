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
    
    private var viewModel: ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currency: Currency = .gbp
        
        // TODO: 後ほど修正
        switch currency {
        case .usd:
            load(RateRequest<USD>())
        case .jpy:
            load(RateRequest<JPY>())
        case .gbp:
            load(RateRequest<GBP>())
        default:
            break
        }
    }
    
    func load<T: CodingKeyMapper>(_ request: RateRequest<T>) {
        Session().send(request) { [weak self] (result) in
            switch result {
            case .success(let object):
                self?.viewModel = ViewModel(
                    source: object.source,
                    rates: [
                        Rate(currency: .usd, rate: object.quotes.usd),
                        Rate(currency: .jpy, rate: object.quotes.jpy),
                        Rate(currency: .eur, rate: object.quotes.eur),
                        Rate(currency: .aud, rate: object.quotes.aud),
                        Rate(currency: .gbp, rate: object.quotes.gbp),
                        Rate(currency: .pln, rate: object.quotes.pln)
                    ]
                )
                
                print("🐹 viewModel: \(String(describing: self?.viewModel))")
                
                break
            case .failure:
                print("👻 error handling")
            }
        }
    }
}

// TODO: 適当なViewModel 後ほど修正する
struct ViewModel {
    let source: Currency
    let rates: [Rate]
}

struct Rate {
    let currency: Currency
    let rate: Double
}
