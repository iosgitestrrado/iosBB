//
//  CategoryTableViewCell.swift
//  bigbasket
//
//  Created by Eppancy on 14/09/22.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    static let identifier = "categoryCell"

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        selectionStyle = .none
    }

    func configure(_ cellData: CategoryModel, isSelectedRow: Bool) {
        if categoryImage != nil {
            categoryImage.sd_setImage(with: URL(string: cellData.Image), placeholderImage: defaultImage)
        }
        if categoryName != nil {
            categoryName.text = cellData.Name
        }
        self.backgroundColor = .clear
        if isSelectedRow {
            self.backgroundColor = .white
        }
    }
}
