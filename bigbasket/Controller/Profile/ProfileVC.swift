//
//  ProfileVC.swift
//  bigbasket
//
//  Created by Deepu S on 05/09/22.
//

import UIKit

class ProfileVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!


    //Options: Wallet, Credits, Points
    private var cellList = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.getProfileData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
}

// MARK: - API Section
extension ProfileVC {
    private func getProfileData() {
<<<<<<< HEAD
       /* if !Reachability.isConnectedToNetwork() {
=======
        if !Reachability.isConnectedToNetwork() {
>>>>>>> 7e3e599e54aa66bbbbf872399de94e7a7256b4b2
            Toast.show()
            return
        }
        Core.ShowProgress(self, detailLbl: "")
        ProfileClient.get { [self] response in
            if var data = response {
                var optionData = [ProfileOptionCellData]()
                optionData.append(ProfileOptionCellData(title: "Wallet".localizableString(), currency: "SAR", value: "\(data.Wallet)"))
                optionData.append(ProfileOptionCellData(title: "Credits".localizableString(), currency: "SAR", value: "\(data.Credits)"))
                optionData.append(ProfileOptionCellData(title: "Points".localizableString(), currency: "SAR", value: "\(data.Loyalty_points)"))
                data.optionCellData = optionData
                cellList.append(data)
            } else {
                cellList.append(ProfileModel())
            }
            cellList.append(ProfileListCellData(title: "MyOrders".localizableString(), image: "orders"))
            cellList.append(ProfileListCellData(title: "MyWishlist".localizableString(), image: "wishlist"))
            cellList.append(ProfileListCellData(title: "ManageAddress".localizableString(), image: "address"))
            cellList.append(ProfileListCellData(title: "Coupons".localizableString(), image: "referral"))
            cellList.append(ProfileListCellData(title: "BusinessDetails".localizableString(), image: "business"))
            cellList.append(ProfileListCellData(title: "Referrals".localizableString(), image: "referral"))
            cellList.append(ProfileListCellData(title: "Support".localizableString(), image: "support"))
            cellList.append(ProfileListCellData(title: "Logout".localizableString(), image: "logout"))
            self.tableView.reloadData()
            Core.HideProgress(self)
<<<<<<< HEAD
        }*/
=======
        }
>>>>>>> 7e3e599e54aa66bbbbf872399de94e7a7256b4b2
    }
}

// MARK: - UITableViewDataSource -
extension ProfileVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
<<<<<<< HEAD
       /* let cellData = cellList[indexPath.row]
=======
        let cellData = cellList[indexPath.row]
>>>>>>> 7e3e599e54aa66bbbbf872399de94e7a7256b4b2
        if let profileData = cellData as? ProfileModel, let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell {
            cell.configure(profileData)
            return cell
        } else if let listData = cellData as? ProfileListCellData, let cell = tableView.dequeueReusableCell(withIdentifier: indexPath.row == cellList.count - 1 ? ListTableViewCell.logoutIdentifier : ListTableViewCell.identifier, for: indexPath) as? ListTableViewCell {
            cell.configure(listData)
            return cell
<<<<<<< HEAD
        }*/
=======
        }
>>>>>>> 7e3e599e54aa66bbbbf872399de94e7a7256b4b2
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate -
extension ProfileVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
