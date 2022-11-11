//
//  CartVC.swift
//  bigbasket
//
//  Created by Deepu S on 05/09/22.
//

import UIKit
import SwiftyJSON

class CartVC: UIViewController {
    
    @IBOutlet weak var coupnViewHight: NSLayoutConstraint!
    @IBOutlet weak var couponBackViewHight: NSLayoutConstraint!
    @IBOutlet weak var couponOfferLabel: UILabel!
    @IBOutlet weak var WalletCashBackView: UIView!
    @IBOutlet weak var selectWalletImg: UIImageView!
    @IBOutlet weak var SelectImageNormalImage: UIImageView!
    @IBOutlet weak var selectImageExpressDelivery: UIImageView!
    @IBOutlet weak var backViewCartEmity: UIView!
    @IBOutlet weak var scroolViewHight: NSLayoutConstraint!
    @IBOutlet weak var tabeViewHight: NSLayoutConstraint!
    @IBOutlet weak var couponBackView: UIView!
    @IBOutlet weak var cartItemTabelView: UITableView!
    @IBOutlet weak var BillViewPrice: UILabel!
    let coreDM = CoreDataManager();
    @IBOutlet weak var BillViewPriceShow: UILabel!
    @IBOutlet weak var BillViewGstShow: UILabel!
    
    @IBOutlet weak var couponTitle: UILabel!
    @IBOutlet weak var BillViewTotal: UILabel!
    @IBOutlet weak var BillViewDiscount: UILabel!
    @IBOutlet weak var BillViewCoupon: UILabel!
    @IBOutlet weak var BillViewDeliveryShow: UILabel!
    
    @IBOutlet weak var addCouponBackView: UIView!
    @IBOutlet weak var beforChekOutCollectionView: UICollectionView!
    @IBOutlet weak var backViewBill: UIView!
    @IBOutlet weak var couponCloseButton: UIButton!
    
    let cartMasterClass = CartMasterClass();
    var cartItem = [Product]();
    var cartData:CartListData?
    var couponList = [Coupon_list]();
  
    var walletBtnTangel = false
    
    var beforecheckoutProducts = [Before_checkout_products]();
    
    //    var total:Double{
    //        cartItem.reduce(0) { (value, cartItem)->Double in
    //            value + cartItem.total
    //        }
    //    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            UIApplication.shared.statusBarStyle = .darkContent
        } else {
            // Fallback on earlier versions
        }
        
        couponCloseButton.setTitle("", for: .normal)
        addCouponBackView.viewSetcornerRadius(radius: 4,showShadow: false)
        WalletCashBackView.viewSetcornerRadius(radius: 4)
        beforChekOutCollectionView.delegate = self
        beforChekOutCollectionView.dataSource = self
        backViewBill.viewSetcornerRadius(radius: 8,showShadow: false)
        // backViewCartEmity.isHidden = true
        // couponBackView.addDashedBorder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.StartSpiner()
        callEndPointGetCart()
        if mcouponOffer.isEmpty {
            couponBackViewHight.constant = 0
            coupnViewHight.constant = 50
        }else{
            couponBackViewHight.constant = 50
            coupnViewHight.constant = 105
        }
        BillViewPrice.text = "\(0) \(Currency)"
        selectImageExpressDelivery.image = UIImage(named: "act-rad")
        BillViewGstShow.text = "\(0) \(Currency)"
        BillViewCoupon.text = "\(0) \(Currency)"
        BillViewDeliveryShow.text = "\(0) \(Currency)"
        callEndPointGetCart()
        callCouponListEndPoint()
        couponTitle.text = mcouponTitle
        couponOfferLabel.text = mcouponOffer
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func updateBillView() {
        BillViewPriceShow.text = "\(cartData?.total_cost ?? "0") \(Currency)"
        BillViewPrice.text = "Price (\(cartData?.cart_count ?? 0) Items)"
        BillViewTotal.text = "\(cartData?.grand_total ?? "0") \(Currency)"
    }
    
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
    func callEndPointGetCart (){
        
        cartMasterClass.getCartEndPoint { [self] mData in
            do{
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(CartListBase.self, from: mData)
                self.StopSpiner()
                if responseModel.httpcode == 200 {
                    
                    if let mbeforecheckoutProducts = responseModel.data?.before_checkout_products {
                        beforecheckoutProducts = mbeforecheckoutProducts
                        beforChekOutCollectionView.reloadData()
                    }
                    
                    if let mProduct = responseModel.data?.product {
                        cartItem = mProduct
                        backViewCartEmity.isHidden = cartItem.isEmpty == true ? false : true
                        cartItemTabelView.delegate = self
                        cartItemTabelView.dataSource = self
                        cartItemTabelView.reloadData()
                        let hight =  self.cartItemTabelView.contentSize.height
                        self.tabeViewHight.constant = hight
                        self.scroolViewHight.constant = self.cartItemTabelView.contentSize.height + 950
                        print("##\(hight)")
                        
                    }
                    
                    if let mcartData = responseModel.data {
                        cartData = mcartData
                        
                    }
                    
                    
                    if let mCartListData = responseModel.data {
                        self.BillViewDiscount.text =  "\(mCartListData.discount ?? "0.0") \(Currency)"
                        updateBillView()
                    }
                    
                }
                else if responseModel.httpcode == 404{
                    backViewCartEmity.isHidden = false
                }
                
                else{
                    backViewCartEmity.isHidden = false
                    
                    self.StopSpiner()}
                
                print("#Cart Item ## \(String(data: mData, encoding: .utf8) ?? "#Error 102")")
            }catch(let Error){
                self.StopSpiner()
                print("#Error \(Error)")
            }
            
        }
    }
    
    //MARK: - Action
    
    @IBAction func RemoveAll(_ sender: Any) {
        cartMasterClass.DeleteAllCart() { [self] mData in
            print("data\(JSON(mData))")
            do{
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(AddCartBaseFile.self, from: mData)
                if responseModel.httpcode == 200 {
                    callEndPointGetCart()
                }else{
                    callEndPointGetCart()
                }
            }catch(let Error){
                
                print("#Error\(Error)")}
            
        }
    }
    @IBAction func clikCoupnClouse(_ sender: Any) {
        couponBackViewHight.constant = 0
        coupnViewHight.constant = 50
    }
    
    @IBAction func clickAddButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "couponListVC") as? couponListVC
        vc?.couponLists = couponList
        self.navigationController?.pushViewController(vc!, animated: true)
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
    @IBAction func clickContinue(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "checkoutVC") as? checkoutVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
    }
}

extension CartVC :UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beforecheckoutProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeforeCheckoutProductsCollectionViewCell", for: indexPath) as! BeforeCheckoutProductsCollectionViewCell
        if !(beforecheckoutProducts[indexPath.row].image?.isEmpty ?? false) {
        if let url = URL(string: beforecheckoutProducts[indexPath.row].image?[0].image ?? ""){
            cell.ProductImage.sd_setImage(with:url, completed: nil)
        }}
        cell.ProductName.text =  beforecheckoutProducts[indexPath.row].product_name
        cell.ProductPrice.text = "\(beforecheckoutProducts[indexPath.row].actual_price ?? "0")"
        cell.backView.viewSetcornerRadius(radius: 8)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = collectionView.bounds.width
        return CGSize(width:collectionViewWidth/2, height:  self.view.frame.width / 2)
        
    }
}

extension CartVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemsTableViewCell", for: indexPath) as! CartItemsTableViewCell
        if !(cartItem[indexPath.row].image?.isEmpty ?? false){
        if let url = URL(string: cartItem[indexPath.row].image?[0].image ?? ""){
            cell.ProductImage.sd_setImage(with: url)
        }}
        cell.ItemNameLabel.text = cartItem[indexPath.row].product_name
        cell.qtyLabel.text = "\(cartItem[indexPath.row].quantity ?? 0)"
        cell.amount.text = "\(Currency) \(cartItem[indexPath.row].unit_actual_price ?? 0)"
        cell.categoryname .text = cartItem[indexPath.row].category_name
        cell.minusButton.setTitle("", for: .normal)
        cell.plusButton.setTitle("", for: .normal)
        cell.plusButton.tag = indexPath.row
        cell.plusButton.addTarget(self, action: #selector(clickPluseButton(sender:)), for: .touchUpInside)
        cell.minusButton.tag = indexPath.row
        cell.minusButton.addTarget(self, action: #selector(clickeminusButton(sender:)), for: .touchUpInside)
        cell.deleteButton.tag = indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(clickDeletebutton(sender:)), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0;//Choose your custom row height
    }
    
    
    @objc func clickDeletebutton(sender:UIButton){
        cartMasterClass.DeleteCart(CartId: cartItem[sender.tag].cart_id ?? 0) { [self] mData in
            print("data\(JSON(mData))")
            do{
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(AddCartBaseFile.self, from: mData)
                if responseModel.httpcode == 200 {
                    callEndPointGetCart()
                }else{
                    callEndPointGetCart()
                }
            }catch(let Error){
                
                print("#Error\(Error)")}
            
        }
    }
    
    @objc func clickPluseButton (sender:UIButton){
        
        var qty = cartItem[sender.tag].quantity
        qty! += 1
        
        cartMasterClass.AddCart(CartId: cartItem[sender.tag].cart_id ?? 0, quantity: qty ?? 0) { [self] mData in
            
            do{
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(AddCartBaseFile.self, from: mData)
                if responseModel.httpcode == 200 {
                    callEndPointGetCart()
                }else{
                    
                }
            }catch(let Error){
                
                print("#Error\(Error)")}
            
        }
        
    }
    
    @objc func clickeminusButton (sender:UIButton){
        var qty = cartItem[sender.tag].quantity
        qty! -= 1
        
        cartMasterClass.AddCart(CartId: cartItem[sender.tag].cart_id ?? 0, quantity: qty ?? 0) { [self] mData in
            
            do{
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(AddCartBaseFile.self, from: mData)
                if responseModel.httpcode == 200 {
                    callEndPointGetCart()
                }else{
                    
                }
            }catch(let Error){
             print("#Error\(Error)")}
        }
    }
}
