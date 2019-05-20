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
        
        collectionView.backgroundColor = UIColor(hex: 0xEEEEEE)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(cellType: RateCell.self)
        
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

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return Currency.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            with: RateCell.self,
            for: indexPath
        )
        
        return cell
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    private var spaceing: CGFloat { return 8.0 }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: spaceing,
                     left: spaceing,
                     bottom: spaceing,
                     right: spaceing)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spaceing
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2
        return CGSize(width: width - (spaceing * 3) / 2,
                      height: 100)
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
