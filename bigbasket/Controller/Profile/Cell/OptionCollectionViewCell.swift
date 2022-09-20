//
//  OptionCollectionViewCell.swift
//  bigbasket
//
//  Created by Eppancy on 15/09/22.
//

import UIKit

class OptionCollectionViewCell: UICollectionViewCell {
    static let identifier = "optionCell"
    static let size = CGSize(width: 190, height: 70)
    
    @IBOutlet weak var optionValueLbl: UILabel!
    @IBOutlet weak var optionTitleLbl: UILabel!
    
    func configure(_ cellData: ProfileOptionCellData) {
        
    }
}
