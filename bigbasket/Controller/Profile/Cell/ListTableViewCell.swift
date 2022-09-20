//
//  ListTableViewCell.swift
//  bigbasket
//
//  Created by Eppancy on 15/09/22.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    static let identifier = "listCell"
    static let logoutIdentifier = "logoutCell"
    static let height = 44.0

    @IBOutlet weak var listImage: UIImageView!
    @IBOutlet weak var listTitleLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        selectionStyle = .none
    }

    func configure(_ cellData: ProfileListCellData) {
        
    }
}
