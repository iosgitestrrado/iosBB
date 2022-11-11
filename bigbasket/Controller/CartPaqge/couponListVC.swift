//
//  couponListVC.swift
//  bigbasket
//
//  Created by Deepu S on 19/10/22.
//

import UIKit

class couponListVC: UIViewController {
    
    @IBOutlet weak var CoupounTBView: UITableView!
    @IBOutlet weak var CouponCodeTextView: UITextField!
    var couponLists = [Coupon_list]();
    let cartMasterClass = CartMasterClass();
    override func viewDidLoad() {
        super.viewDidLoad()
        CoupounTBView.delegate = self
        CoupounTBView.dataSource = self
        CoupounTBView.reloadData()
    }
    @IBAction func clickApply(_ sender: Any) {
        
        
    }
}

extension couponListVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        couponLists .count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coupenListTableViewCell", for: indexPath) as! coupenListTableViewCell
        cell.CouponCodeLabel.text = "code:\(couponLists[indexPath.row].coupon_code ?? "") "
        cell.coupenTitleLabel.text = couponLists[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cartMasterClass.applyCoupon(CoupenCode: couponLists[indexPath.row].coupon_code ?? "" ) { [self] mData in
            do{
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(couponListBase.self, from: mData)
                self.StopSpiner()
                if responseModel.httpcode == 200 {
                    self.navigationController?.popViewController(animated: true)
                    mcouponId    = couponLists[indexPath.row].coupon_id ?? 0
                    mcouponCode  = couponLists[indexPath.row].coupon_code ?? ""
                    mcouponTitle = couponLists[indexPath.row].title ?? ""
                    mcouponOffer = couponLists[indexPath.row].offer ?? ""
                }
                else if responseModel.httpcode == 404 {
                    self.view.ShowMessage(message: responseModel.message ?? "")
                    self.navigationController?.popViewController(animated: true)
                }
            }catch(let Error){
                print("error\(Error.localizedDescription)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0;//Choose your custom row height
    }
}
