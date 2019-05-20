//
//  RateCell.swift
//  PaymentCodeChallenge
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import UIKit

final class RateCell: UICollectionViewCell {
    
    @IBOutlet private weak var currencyLabel: UILabel!
    @IBOutlet private weak var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        currencyLabel.text = "---"
        rateLabel.text = "---"
    }
    
    func setUp(rate: Rate) {
        currencyLabel.text = rate.currency.code
        rateLabel.text = "\(rate.rate)"
    }
}
