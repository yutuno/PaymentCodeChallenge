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
    
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    
    private var rateViewModel: RateViewModel?
    
    private let session: SessionProtocol
    
    init(session: SessionProtocol = Session()) {
        self.session = session
        
        super.init(nibName: HomeVC.className, bundle: .main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "為替レート"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        changeButton.layer.cornerRadius = 10
        
        collectionView.backgroundColor = UIColor(hex: 0xEEEEEE)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(cellType: RateCell.self)
        
        let currency: Currency = .usd
        
        load(currency: currency)
    }
    
    private func load(currency: Currency) {
        switch currency {
        case .usd:
            load(RateRequest<USD>())
        case .jpy:
            load(RateRequest<JPY>())
        case .eur:
            load(RateRequest<EUR>())
        case .aud:
            load(RateRequest<AUD>())
        case .gbp:
            load(RateRequest<GBP>())
        case .pln:
            load(RateRequest<PLN>())
        }
    }
    
    private func load<T: CodingKeyMapper>(_ request: RateRequest<T>) {
        session.send(request) { [weak self] (result) in
            switch result {
            case .success(let object):
                self?.rateViewModel = RateViewModel(
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
                
                print("🐹 viewModel: \(String(describing: self?.rateViewModel))")
                
                DispatchQueue.main.async {
                    self?.sourceLabel.text = object.source.code
                    self?.collectionView.reloadData()
                }
            case .failure(let error):
                print("👻 Error: \(error.localizedDescription)")
            }
        }
    }
    
    @IBAction func tappedButton(_ sender: UIButton) {
        showActionSheet { [weak self] (currency) in
            self?.load(currency: currency)
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
        
        if let rate = rateViewModel?.rates[indexPath.item] {
            cell.setUp(rate: rate)
        }
        
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
