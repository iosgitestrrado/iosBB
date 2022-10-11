//
//  CategoryCollectionViewCell.swift
//  bigbasket
//
//  Created by Eppancy on 14/09/22.
//

import UIKit
import SDWebImage

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "categoryCell"
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    
    func configure(_ cellData: SubCategoryModel) {
        if categoryImage != nil {
            categoryImage.sd_setImage(with: URL(string: cellData.Image), placeholderImage: defaultImage)
        }
        if categoryName != nil {
            categoryName.text = cellData.Name
        }
    }
}
