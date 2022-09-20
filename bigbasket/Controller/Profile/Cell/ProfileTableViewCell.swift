//
//  ProfileTableViewCell.swift
//  bigbasket
//
//  Created by Eppancy on 15/09/22.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    static let identifier = "profileCell"
    static let height = 336.0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var profileNameLbl: UILabel!
    @IBOutlet weak var mobileNumberLbl: UILabel!
    @IBOutlet weak var emailIdLbl: UILabel!
    @IBOutlet weak var profileEditButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!

    private let font14 = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14) ]
    private let font18 = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18) ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        selectionStyle = .none
    }

    func configure(_ cellData: ProfileModel) {
        
    }
}

// MARK: - UICollectionViewDataSource -
extension ProfileTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let currency = "SAR"
//        let value = "10000"
//        let valueString = NSMutableAttributedString(string: "\(currency) \(value)")
//        valueString.addAttributes(font14 as [NSAttributedString.Key : Any], range: NSRange(location: 0, length: currency.count - 1))
//        valueString.addAttributes(font18 as [NSAttributedString.Key : Any], range: NSRange(location: currency.count + 1, length: currency.count + 1 + value.count))
        
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegate -
extension ProfileTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

// MARK: - UICollectionViewDelegateFlowLayout -
extension ProfileTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return OptionCollectionViewCell.size
    }
}
