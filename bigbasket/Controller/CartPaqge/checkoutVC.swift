//
//  checkoutVC.swift
//  bigbasket
//
//  Created by Deepu S on 29/09/22.
//

import UIKit
import SwiftyJSON

class checkoutVC: UIViewController {
    
    @IBOutlet weak var couponBackViewHight: NSLayoutConstraint!
    @IBOutlet weak var couponViewHight: NSLayoutConstraint!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var SelectImageNormalImage: UIImageView!
    @IBOutlet weak var selectImageExpressDelivery: UIImageView!
    @IBOutlet weak var WalletCashBackView: UIView!
    @IBOutlet weak var selectWalletImg: UIImageView!
    @IBOutlet weak var succesPriceLabel: UILabel!
    @IBOutlet weak var succesBackView: UIView!
    @IBOutlet weak var billToatalAmount: UILabel!
    @IBOutlet weak var billpriceLabel: UILabel!
    @IBOutlet weak var PlaceOrderButton: UIButton!
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
    var walletBtnTangel = false
    var addresslist = [Address_list]();
    let cartMasterClass = CartMasterClass();
    var cartData:CartListData?
    var couponList = [Coupon_list]();
    var addressId = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectImageExpressDelivery.image = UIImage(named: "act-rad")
        PlaceOrderButton.setTitle("", for: .normal)
        UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseIn]) {
            self.succesBackView.alpha = 0
           // self.succesBackView.isHidden = true
            self.succesBackView.transform = CGAffineTransform.init(scaleX: 0, y: 0)
        } completion: { finish in
            
        }
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseIn]) {
            self.succesBackView.alpha = 0
           // self.succesBackView.isHidden = true
            self.succesBackView.transform = CGAffineTransform.init(scaleX: 0, y: 0)
        } completion: { finish in
            
        }
        callEndPointGetCart()
        callCouponListEndPoint()
        callAddressListEndPoint()
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //MARK: - Action
    
    @IBAction func clickAddCoupen(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "couponListVC") as? couponListVC
        vc?.couponLists = couponList
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func clickAddressChange(_ sender: Any) {
        
        picker = UIPickerView.init()
        picker.delegate = self
        picker.dataSource = self
        picker.backgroundColor = UIColor.white
        picker.setValue(UIColor.black, forKey: "textColor")
        picker.autoresizingMask = .flexibleWidth
        picker.contentMode = .center
        picker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(picker)
        
        toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.barStyle = .default
        toolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
        self.view.addSubview(toolBar)
        
    }
    @objc func onDoneButtonTapped() {
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
    }
    
    
    
    @IBAction func clickBackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func clickWalletCase(_ sender: Any) {
        
        if walletBtnTangel {
            selectWalletImg.image =  UIImage(named: "inact-check")
            walletBtnTangel = false
        }else{
            selectWalletImg.image =  UIImage(named: "act-check")
            walletBtnTangel = true
           
        }
       
    }
    
    @IBAction func ClickNorrmalButton(_ sender: Any) {
        SelectImageNormalImage.image = UIImage(named: "act-rad")
        selectImageExpressDelivery.image = UIImage(named: "inact-rad")
    }
    @IBAction func ClickExpressButton(_ sender: Any) {
        selectImageExpressDelivery.image = UIImage(named: "act-rad")
        SelectImageNormalImage.image = UIImage(named: "inact-rad")
    }
   
  
    @IBAction func clickCOD(_ sender: Any) {
        self.StartSpiner()
        let userDefaultClass = UserDefaultClass();
        let TotalCast = Double(cartData?.total_cost ?? "0.0") ?? 0.0
        let TotalTax = Double(cartData?.total_tax ?? "0.0") ?? 0.0
        let grandTotal = Double(cartData?.grand_total ?? "0.0") ?? 0.0
        cartMasterClass.PlaceOrder(placeOrder: PlaceOrder.init(total_cost: TotalCast, total_tax: TotalTax, is_coupon: false, coupon_id: "0", discount_type: "discount", discount_amt: "0.0", packing_charge: "0.0", shipping_charge: "0.0", payment_type: 3, message: "nil", access_token: userDefaultClass.getUserDefaultString(key: .accessToken), currency_code: Currency, lang_id: "1", invite_coupon_id: "0", total_amt: grandTotal, e_money_amt: "0", reward_id: "0", reward_amt: "0", address_id: addressId, branch_id: "0", device_id: "54655656fdf", page_url: "cart/us/img", os_type: "web")) { mData in
            
            do {
                self.StopSpiner()
                let jsonData = JSON(mData)
                
                if jsonData["httpcode"] == 200 {
                    UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseIn]) {
                        self.succesBackView.isHidden = false
                        self.succesBackView.alpha = 1
                        self.succesBackView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                    } completion: { finish in
                        
                    }
                }
                
            }catch(let Error){
                self.StopSpiner()
                print(Error.localizedDescription)
            }
        }
       
    }
    
    // MARK: - Func
    func callCouponListEndPoint(){
        cartMasterClass.couponList { [self] mData in
            do{
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(couponListBase.self, from: mData)
                self.StopSpiner()
                if responseModel.httpcode == 200 {
                    
                    if let mcouponList = responseModel.coupon_list{
                        couponList = mcouponList
                       print("CouponList\(couponList)")
                    }
                }}catch(let Error){
                    print("error\(Error.localizedDescription)")
                }
        }
    }
    
    func callAddressListEndPoint(){
        cartMasterClass.callAddressList() { [self] mData in
            do{
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(AddressBase.self, from: mData)
                self.StopSpiner()
                if responseModel.httpcode == "200" {
                    
                    if let mAddress = responseModel.data?.address_list{
                        addresslist = mAddress
                       print("Addresslist\(addresslist)")
                    }
                }}catch(let Error){
                    print("error\(Error.localizedDescription)")
                }
        }
    }
    
    
    func callEndPointGetCart (){
        self.StartSpiner()
        cartMasterClass.getCartEndPoint { [self] mData in
            do{
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(CartListBase.self, from: mData)
                self.StopSpiner()
                if responseModel.httpcode == 200 {
                    if let mcartData = responseModel.data {
                        cartData = mcartData
                        billpriceLabel.text = "\(cartData?.total_cost ?? "0.0" )\(Currency)"
                        billToatalAmount.text = "\(cartData?.grand_total ?? "0.0")\(Currency)"
                        succesPriceLabel.text = "Your Payment of \(Currency) \(cartData?.grand_total ?? "0.0")"
                        //print("#\(cartData?.total_cost)")
                    }
                }
                else if responseModel.httpcode == 404   {
                    
                    navigationController?.popToRootViewController(animated: false)
                    
                }
                
                else{
                    self.StopSpiner()}
                
                print("#Cart Item ## \(String(data: mData, encoding: .utf8) ?? "#Error 102")")
            }catch(let Error){
                self.StopSpiner()
                print("#Error \(Error)")
            }
       
        }}}
extension checkoutVC:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return addresslist.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return addresslist[row].address2
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        addressId =  addresslist[row].id ?? 0
        addressLabel.text = addresslist[row].address2 ?? ""
        
    }
}
