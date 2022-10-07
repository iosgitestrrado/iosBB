//
//  ProductDetailsViewController.swift
//  bigbasket
//
//  Created by Deepu S on 22/09/22.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    @IBOutlet weak var offerPriceBackView: UIView!
    @IBOutlet weak var offerPriceLabel: UILabel!
    @IBOutlet weak var offerLabel: UILabel!
    @IBOutlet weak var minuseBackView: UIView!
    @IBOutlet weak var QtyBackview: UIView!
    @IBOutlet weak var pluseBackView: UIView!
    @IBOutlet weak var scroolView: UIScrollView!
    @IBOutlet weak var CustomerViewedCollectionView: UICollectionView!
    @IBOutlet weak var SimilarItemsCollectionView: UICollectionView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var TotalAmountLabel: UILabel!
    @IBOutlet weak var subCategoryLabel: UILabel!
    @IBOutlet weak var DeatilBackView: UIView!
    @IBOutlet weak var segmentControal: UISegmentedControl!
    
    @IBOutlet weak var QtyLabel: UILabel!
    @IBOutlet weak var ProductPriceLabel: UILabel!
    @IBOutlet weak var QtyTextField: UITextField!
    @IBOutlet weak var ratingReviewLabel: UILabel!
    @IBOutlet weak var RatingLabel: UILabel!
    @IBOutlet weak var ProductNameLabel: UILabel!
    @IBOutlet weak var ProductCollectionView: UICollectionView!
    var categoryId = 0
    var product:Product?
    var productDetailImage = [ProductDetaiImage]();
    var varaiantsList = [Varaiants_list]();
    var relativeProducts = [Relative_products]();
    var viewedProducts = [Viewed_products]();
    let coreDM = CoreDataManager();
    
    var qty:Int = 1
    var mimQty = 0
    var eachAmount:Double = 0.0
    var totalAmount:Double{
        return Double(qty) * eachAmount
    }
    
    
    var pickerView = UIPickerView()
    let productDetailsMasterClass = ProductDetailsMasterClass();
    override func viewDidLoad() {
        super.viewDidLoad()
        
        minuseBackView.viewSetcornerRadiusRedColor(radius: 4)
        pluseBackView.viewSetcornerRadiusRedColor(radius: 4)
        offerPriceBackView.viewSetcornerRadius(radius: 4)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        QtyTextField.inputView = pickerView
        ProductCollectionView.delegate = self
        ProductCollectionView.dataSource = self
        SimilarItemsCollectionView.dataSource = self
        SimilarItemsCollectionView.dataSource = self
        CustomerViewedCollectionView.dataSource = self
        CustomerViewedCollectionView.delegate = self
        self.StartSpiner()
        productDetailsMasterClass.ProductDetailsEndPoint(categoryId: categoryId) { mData in
            self.StopSpiner()
            do{
                print(String(data: mData, encoding: .utf8) ?? "#nill")
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(ProductDetailBase.self, from: mData)
                if responseModel.httpcode == 200 {
                    if let mproduct = responseModel.data?.product {
                        self.product = mproduct
                    }
                    if let mrelativeProducts = responseModel.data?.relative_products {
                        self.relativeProducts = mrelativeProducts
                        self.SimilarItemsCollectionView.reloadData()
                    }
                    if let mViewedProducts = responseModel.data?.viewed_products {
                        self.viewedProducts = mViewedProducts
                        self.CustomerViewedCollectionView.reloadData()
                    }
                    if let mVaraiantslist = responseModel.data?.varaiants_list{
                        self.varaiantsList = mVaraiantslist
                        if !self.varaiantsList.isEmpty {
                            self.QtyTextField.text = self.varaiantsList[0].combination
                            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string:"\(self.varaiantsList[0].actual_price ?? "0.0") \(Currency)")
                            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
                            self.ProductPriceLabel.attributedText = attributeString //"\(self.varaiantsList[0].actual_price ?? "0.0") \(Currency)"
                            self.eachAmount =  Double(self.varaiantsList[0].actual_price ?? "0.0") ?? 0.0
                            self.TotalAmountLabel.text = "\(self.totalAmount) SAR"
                            self.QtyLabel.text = "\(self.qty)"
                        }
                    }
                    self.categoryLabel.text = responseModel.data?.product?.category_name
                    self.subCategoryLabel.text = responseModel.data?.product?.subcategory_name
                    self.descriptionLabel.text = responseModel.data?.product?.short_description
                    self.ProductNameLabel.text = responseModel.data?.product?.product_name
                    self.RatingLabel.text = "\(responseModel.data?.product?.rating ?? 0)"
                    self.ratingReviewLabel.text = "(\(responseModel.data?.product?.rating ?? 0) rating & \(responseModel.data?.product?.total_reviews ?? 0) view)"
                    if let mProduct = responseModel.data?.product?.image {
                        self.productDetailImage = mProduct
                        self.ProductCollectionView.reloadData()
                    }else{
                        
                    }
                }
                if responseModel.httpcode == 404 {
                    self.view.makeToast(responseModel.message)
                }
                
            }catch(let Error){
                print("#Error \(Error)")
            }
            
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    //MARK: - Func
    func goToCart (){
        if let tabBarController = self.navigationController?.tabBarController  {
                tabBarController.selectedIndex = 3
            }
    }
    
    @IBAction func segementControal(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            DeatilBackView.isHidden = false
        }
        else{
            DeatilBackView.isHidden = true
        }
        
    }
    
    @IBAction func ClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func clickAddCart(_ sender: Any) {
        
        productDetailsMasterClass.AddCart(productId: product?.product_id ?? 0, quantity: self.qty) { [self] mData in
            print(String(data: mData, encoding: .utf8) ?? "#nill")
            do{
                
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(AddCartBaseFile.self, from: mData)
                if responseModel.httpcode == 200 {
                    goToCart()
                    if coreDM.isItemInCat(ItemId: self.product?.product_id ?? 0) {
                        if let url = URL(string: productDetailImage[0].image ?? ""){}
                        
                        coreDM.saveCart(item: product?.product_name ?? "", itemId: product?.product_id ?? 0, qty: Double(self.qty), amount: eachAmount, total: totalAmount, imgUrl:productDetailImage[0].image ?? "")
                    }else{
                        coreDM.updateCat(ItemId: product?.product_id ?? 0, qty: Double(self.qty),totalAmount: totalAmount)
                    }
                    // let item =  coreDM.getAllCartItems()
                }
            }catch(let Error){
                print("#Error \(Error.localizedDescription)")
            }}}
    
    
    @IBAction func clickPluse(_ sender: Any) {
        
        qty += 1
        QtyLabel.text = "\(qty)"
        TotalAmountLabel.text = "\(totalAmount) SAR"
    }
    
    
    @IBAction func clickMinusButton(_ sender: Any) {
        if qty > mimQty {
            qty -= 1
            QtyLabel.text = "\(qty)"
            TotalAmountLabel.text = "\(totalAmount) SAR"
        }}
}

extension ProductDetailsViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return varaiantsList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return varaiantsList[row].combination
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        QtyTextField.text = varaiantsList[row].combination
        ProductPriceLabel.text =  "\(self.varaiantsList[row].actual_price ?? "0.0") \(Currency)"
    }
}

extension ProductDetailsViewController:  UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == SimilarItemsCollectionView {
            return  relativeProducts .count
        }
        if collectionView == CustomerViewedCollectionView {
            return viewedProducts.count
        }
        else {
            return productDetailImage .count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == SimilarItemsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SimilarItemsCollectionViewCell", for: indexPath) as! SimilarItemsCollectionViewCell
            cell.Backview.viewSetcornerRadius(radius: 8)
            cell.ProductName.text = relativeProducts[indexPath.row].product_name
            cell.ProductPrice.text = "\(relativeProducts[indexPath.row].actual_price ?? "0") \(Currency)"
            if let url = URL(string: relativeProducts[indexPath.row].image?[0].image ?? ""){
                cell.ProductImage.sd_setImage(with: url)
            }
            return cell
        }
        
        if collectionView == CustomerViewedCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomerViewedCollectionViewCell", for: indexPath) as! CustomerViewedCollectionViewCell
            cell.BackView.viewSetcornerRadius(radius: 8)
            cell.ProductName.text = viewedProducts[indexPath.row].product_name
            cell.ProductPrice.text = "\(viewedProducts[indexPath.row].actual_price ?? "0") \(Currency)"
            if !(viewedProducts[indexPath.row].image?.isEmpty ?? true){
                if let url = URL(string: viewedProducts[indexPath.row].image?[0].image ?? ""){
                    cell.ProductImage.sd_setImage(with: url)
                }}
            return cell
            
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailsCollectionViewCell", for: indexPath) as! ProductDetailsCollectionViewCell
            cell.BackView.viewSetcornerRadius(radius: 8,showShadow: false)
            cell.QtyBackView.viewRoundCorners(with: .both, radius: 4,showBorders: true)
            if let url = URL(string: productDetailImage[indexPath.row].image ?? ""){
                cell.ProductImage.sd_setImage(with: url)
            }
            cell.QtyLabel.text = "Qty \(product?.minimum_quantity ?? 0)"
            QtyLabel.text = "\(product?.minimum_quantity ?? 0)"
            mimQty = product?.minimum_quantity ?? 0
            qty = product?.minimum_quantity ?? 0
            
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == SimilarItemsCollectionView {
            let collectionViewWidth = collectionView.bounds.width
            return CGSize(width:collectionViewWidth / 2.1, height:  self.view.frame.width / 5)
        }
        
        if collectionView == CustomerViewedCollectionView {
            let collectionViewWidth = collectionView.bounds.width
            return CGSize(width:collectionViewWidth / 2.1, height:  self.view.frame.width / 2)
        }
        
        else{
            let collectionViewWidth = collectionView.bounds.width
            return CGSize(width:collectionViewWidth / 5, height:  self.view.frame.width / 2)
        }
    }
}
