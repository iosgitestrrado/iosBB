//
//  CartItemsTableViewCell.swift
//  bigbasket
//
//  Created by Deepu S on 26/09/22.
//

import UIKit

class CartItemsTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryname: UILabel!
    @IBOutlet weak var ProductImage: UIImageView!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var qtyLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var ItemNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
