//
//  coupenListTableViewCell.swift
//  bigbasket
//
//  Created by Deepu S on 19/10/22.
//

import UIKit

class coupenListTableViewCell: UITableViewCell {

    @IBOutlet weak var CouponCodeLabel: UILabel!
    @IBOutlet weak var CouponDistributionLabel: UILabel!
    @IBOutlet weak var coupenTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
