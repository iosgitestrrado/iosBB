//
//  ProductListViewController.swift
//  bigbasket
//
//  Created by Deepu S on 19/09/22.
//

import UIKit
import SwiftyJSON

class ProductListViewController: UIViewController {
    @IBOutlet weak var HeaderNameLabel: UILabel!
    @IBOutlet weak var AllbuttonBackView: UIView!
    @IBOutlet weak var ReviewLabel: UILabel!
    @IBOutlet weak var ProductCollectionView: UICollectionView!
    @IBOutlet weak var CategoryNameCollectionView: UICollectionView!
    @IBOutlet weak var SearchSubBackView: UIView!
    @IBOutlet weak var SearchBackView: UIView!
    @IBOutlet weak var ProductCollectionTopConstrain: NSLayoutConstraint!
    @IBOutlet weak var ResultLabel: UILabel!
    var mProductData = [ProductsData]();
    var mProductDataCategory = [ProductByCategoryProducts]();
    var subcategory = [Subcategory]();
    var VaraiantsList = [ProuctListVariants_list]();
    let productListMasterClass = ProductListMasterClass()
    var subUrl = ""
    var selectFavindex = 0
    var combination = ""
    var selectCategoryIndex = -1
    var selectTagVaraiantList = 0
    var selectAddCartIndex = -1
    var minOrderQty = 0
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
    var categoryId = "0"
    var favCategoryId = "0"
    var selectFavSelectIndex = -1
    var categoryName = ""
    var subcategoryId = "0"
    var brandId = "0"
    var lowToHigh = "0"
    var highToLow = "0"
    var latest = "0"
    var popular = "0"
    var bulkOrderQty = 1
    var isShowSubcategory = false
    var isCallFilterApi = false
    var qty = 0
    var isClickSort = false
    var Sort = ["Popularity","Newest First","Price - Low to High","Price - High to Low"]
    var HeaderName = "Product List"
    let serialQueue = DispatchQueue(label: "swiftlee.serial.queue")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SearchBackView.viewRoundCorners(with: .both, radius: 5)
        SearchSubBackView.viewSetcornerRadius2(radius: 8,showShadow: false)
        CategoryNameCollectionView.delegate = self
        CategoryNameCollectionView.dataSource = self
        ProductCollectionView.delegate = self
        ProductCollectionView.dataSource = self
        AllbuttonBackView.viewSetcornerRadius2(radius: 8,showShadow: false)
        callEndPointSubcategory()
        if isShowSubcategory || isCallFilterApi{
            callProductListEndPoint()
            
        }else{
            callProductByCategory()
        }
        //
        
        if #available(iOS 13.0, *) {
            UIApplication.shared.statusBarStyle = .darkContent
        } else {
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
        HeaderNameLabel.text = HeaderName
        ProductCollectionTopConstrain.constant = isShowSubcategory ? 95:2
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //MARK: - Action
    
    @IBAction func clickSort(_ sender: Any) {
        clickSort()
    }
    @IBAction func clickAllButton(_ sender: Any) {
        callProductListEndPoint()
    }
    
    @IBAction func clickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Func
    
     func clickSort(){
        isClickSort = true
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
    
    func callVariantsList (index:Int){
        if let mvaraiantsList = mProductData[index].variants_list {
            VaraiantsList = mvaraiantsList
        }
    }
    
    
    func callProductByCategory(){
        productListMasterClass.ProductByCategoryListEndPoint(subUrl: subUrl, categoryId: self.categoryId, subcategoryId: self.subcategoryId, brandId: self.brandId, lowToHigh: self.lowToHigh, highToLow: self.highToLow, latest: self.latest, popular: self.popular) { [self] mData in
            let DataDecos = String(data: mData, encoding: .utf8)
            // print("#Response : \(DataDecos)" )
            do{
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(ProductListingBase.self, from: mData)
                if let productData = responseModel.data?.products {
                    self.mProductData = productData
                    let attributes = [[NSAttributedString.Key.foregroundColor:UIColor(red: 0 / 255.0, green: 117 / 255.0, blue: 227 / 255.0, alpha: 1.0)], [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]]
                    self.ResultLabel.attributedText = "\(mProductData.count) results for \(categoryName)".highlightWordsIn(highlightedWords: "\(categoryName)", attributes: attributes)
                    self.ProductCollectionView.reloadData()
                }
            }
            catch(let Error){
                print(Error.localizedDescription)
            }
        }
    }
    
    func callProductListEndPoint(){
        productListMasterClass.ProductListEndPoint(categoryId: self.categoryId, subcategoryId: self.subcategoryId, brandId: self.brandId, lowToHigh: self.lowToHigh, highToLow: self.highToLow, latest: self.latest, popular: self.popular) { [self] mData in
            let DataDecos = String(data: mData, encoding: .utf8)
            print("#Response : \(DataDecos)" )
            
            do{
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(ProductListingBase.self, from: mData)
                if let productData = responseModel.data?.products {
                    self.mProductData = productData
                    let attributes = [[NSAttributedString.Key.foregroundColor:UIColor(red: 0 / 255.0, green: 117 / 255.0, blue: 227 / 255.0, alpha: 1.0)], [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]]
                    self.ResultLabel.attributedText = "\(mProductData.count) results for \(categoryName)".highlightWordsIn(highlightedWords: "\(categoryName)", attributes: attributes)
                    self.ProductCollectionView.reloadData()
                }
            }
            catch{}
        }
    }
    
    func callProductListWithFilterEndPoint(index:Int){
        productListMasterClass.ProductListEndPoint(categoryId: self.categoryId, subcategoryId: self.subcategoryId, brandId: self.brandId, lowToHigh: self.lowToHigh, highToLow: self.highToLow, latest: self.latest, popular: self.popular) { [self] mData in
            let DataDecos = String(data: mData, encoding: .utf8)
            print("#Response : \(DataDecos)" )
            
            do{
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(ProductListingBase.self, from: mData)
                if let productData = responseModel.data?.products {
                    serialQueue.sync {
                        self.mProductData = productData
                        let attributes = [[NSAttributedString.Key.foregroundColor:UIColor(red: 0 / 255.0, green: 117 / 255.0, blue: 227 / 255.0, alpha: 1.0)], [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]]
                        self.ResultLabel.attributedText = "\(mProductData.count) results for \(categoryName)".highlightWordsIn(highlightedWords: "\(categoryName)", attributes: attributes)
                        let searchData = subcategory[index].subcategory_name ?? ""
                        let filterData = mProductData.filter { mdata in
                            mdata.subcategory_name == searchData
                        }
                        if filterData.isEmpty{
                            mProductData.removeAll()
                            self.ResultLabel.attributedText = "\(mProductData.count) results for \(categoryName)".highlightWordsIn(highlightedWords: "\(categoryName)", attributes: attributes)
                            ProductCollectionView.reloadData()
                            
                        }else{
                            mProductData = filterData
                            self.ResultLabel.attributedText = "\(mProductData.count) results for \(categoryName)".highlightWordsIn(highlightedWords: "\(categoryName)", attributes: attributes)
                            ProductCollectionView.reloadData()
                            print("Data\(filterData)")
                        }}
                }
                CategoryNameCollectionView.reloadData()
            }
            catch{}
        }
    }
    
    
    func AddCart(productId:Int,Quantity:Int){
        productListMasterClass.AddNewCart(productId: productId, quantity: Quantity) { [self] mData in
            print(String(data: mData, encoding: .utf8) ?? "#nill")
            do{
                
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(AddCartBaseFile.self, from: mData)
                if responseModel.httpcode == 200 {
                    
                }
                else{
                    
                    self.view.makeToast(responseModel.message)
                    
                }
            }catch(let Error){
                print("#Error \(Error.localizedDescription)")
            }
            
        }
        
    }
    
    func AddCartEndPoint(productId:Int,Quantity:Int){
        productListMasterClass.AddCart(productId: productId, quantity: Quantity) { [self] mData in
            print(String(data: mData, encoding: .utf8) ?? "#nill")
            do{
                
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(AddCartBaseFile.self, from: mData)
                if responseModel.httpcode == 200 {
                    
                }
                else{
                    
                    self.view.makeToast(responseModel.message)
                    
                }
            }catch(let Error){
                print("#Error \(Error.localizedDescription)")
            }
            
        }
        
    }
    
    func callEndPointSubcategory(){
        self.StartSpiner()
        productListMasterClass.ProductListSubcategoryEndPoint(categoryId: categoryId) { [self] mData in
            do{
                self.StopSpiner()
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(ProductListSubcategoryBase.self, from: mData)
                if let mSubcategory = responseModel.data?.subcategory {
                    subcategory = mSubcategory
                    CategoryNameCollectionView.reloadData()
                }
                print("# ProductListSubcategory :: \(responseModel)")
            }catch(let Error){
                self.StopSpiner()
                print("#Error \(Error.localizedDescription)")
            }
        }
    }
    
}

extension  ProductListViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == ProductCollectionView {
            
            return mProductData.count
            
        }
        else  {
            return subcategory.count
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       
        if collectionView == ProductCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductListCollectionViewCell", for: indexPath) as! ProductListCollectionViewCell
            
            //            if isShowSubcategory {
            //                if !(mProductDataCategory[indexPath.row].image?.isEmpty ?? true) {
            //                    if let url = URL(string:mProductDataCategory[indexPath.row].image?[0].image ?? ""){
            //                        print("#URL\(url)")
            //                        cell.ProductImage.sd_setImage(with: url, placeholderImage: UIImage(named: "logo"))
            //                    }
            //                }
            //            }else{
            if !mProductData[indexPath.row].image.isEmpty {
                if let url = URL(string: mProductData[indexPath.row].image[0]?.image ?? ""){
                    print("#URL\(url)")
                    cell.ProductImage.sd_setImage(with: url, placeholderImage: UIImage(named: "logo"))
                }
            }
            
            
            
            
            if  !(mProductData[indexPath.row].variants_list?.isEmpty ?? true) {
                if mProductData[indexPath.row].variants_list?.count == 1 {
                    cell.dropImage.isHidden = true
                }else{
                    cell.dropImage.isHidden = false
                }
                cell.Combination.isHidden = false
                cell.qtyBackView.isHidden = false
                if selectTagVaraiantList == indexPath.row {
                    cell.Combination.text = combination.isEmpty ? mProductData[indexPath.row].variants_list?[0].combination : combination
                }else{
                    cell.Combination.text = mProductData[indexPath.row].variants_list?[0].combination
                }
            }else{
                cell.Combination.isHidden = true
                cell.qtyBackView.isHidden = true
            }
            
            //MARK: - click Add Button
            
            if selectAddCartIndex == indexPath.row {
                
               // callVariantsList(index: selectTagVaraiantList)
                
                if mProductData[selectAddCartIndex].variants_list?.count == 0 {
                    // minOrderQty = mProductData[selectAddCartIndex].min_order_qty ?? 0
                    cell.qtyLabel.text = "\(qty)"
                }
                else{
                    // minOrderQty = VaraiantsList[selectAddCartIndex].min_order_qty ?? 0
                    cell.qtyLabel.text = "\(qty)"
                }
                
                if qty < minOrderQty {
                    AddCartEndPoint(productId: mProductData[selectAddCartIndex].product_id ?? 0, Quantity: 0)
                    cell.BackViewAddButton.isHidden = false
                    cell.qtyAddStackView.isHidden = true
                }
                
                else{
                    
                    if  (mProductData[selectAddCartIndex].variants_list?.isEmpty ?? true) {
                        if qty <= 1 {
                           AddCart(productId: mProductData[selectAddCartIndex].product_id ?? 0, Quantity: qty)
                            
                        }else{
                            AddCartEndPoint(productId: mProductData[selectAddCartIndex].product_id ?? 0, Quantity: qty)
                        }
                        
                    }else{
                        if qty <= 1 {
                            AddCart(productId: VaraiantsList[selectAddCartIndex].pro_id ?? 0, Quantity: qty)
                        }else{
                            AddCartEndPoint(productId: VaraiantsList[selectAddCartIndex].pro_id ?? 0, Quantity: qty)
                        }
                    }
                }
                cell.BackViewAddButton.isHidden = true
                cell.qtyAddStackView.isHidden = false
            }
            else{
                cell.BackViewAddButton.isHidden = false
                cell.qtyAddStackView.isHidden = true
            }
            
            if selectFavSelectIndex == indexPath.row {
                cell.favImage.image = UIImage(named: "act-wish")
            }else{
                cell.favImage.image = UIImage(named: "inact-wish")
            }
            
            cell.ProductName.text = mProductData[indexPath.row].product_name
            cell.ReviewLabel.text = "(\(mProductData[indexPath.row].rating ?? 0) Rating & \(mProductData[indexPath.row].total_reviews ?? 0) Review)"
            cell.RatingLabel.text = "\(mProductData[indexPath.row].rating ?? 0)"
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "\(mProductData[indexPath.row].actual_price ?? "0") \(Currency)")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1.5, range: NSRange(location: 0, length: attributeString.length))
            if mProductData[indexPath.row].offer_price == "0.00"{
                cell.PriceLabel.text = "\(mProductData[indexPath.row].actual_price ?? "0") \(Currency)"
                cell.offerPriceBackView.isHidden = true
                cell.offBackView.isHidden = true
            }else{
                cell.PriceLabel.attributedText = attributeString
                cell.offerPriceBackView.isHidden = false
                cell.offBackView.isHidden = false
            }
       
            cell.offLabel.text = "\(mProductData[indexPath.row].offer ?? "")"
            cell.offerPriceLabel.text =  "\(mProductData[indexPath.row].offer_price ?? "0.0") \(Currency)"
            cell.BackView.alpha = mProductData[indexPath.row].is_out_of_stock ?? true ? 0.5 : 1
            cell.BackView.viewSetcornerRadius(radius: 8,showShadow: false)
            cell.offerPriceBackView.viewSetcornerRadius(radius:4,showShadow: false)
            cell.BackViewAddButton.viewSetcornerRadiusBlueColor(radius: 4,showShadow: false)
            cell.clickPickerviewButton.tag = indexPath.row
            cell.clickPickerviewButton.addTarget(self, action: #selector(clickPicke(sender:)), for: .touchUpInside)
            cell.clickAddCart.tag = indexPath.row
            cell.clickAddCart.addTarget(self, action: #selector(clickAddCart(sender:)), for: .touchUpInside)
            cell.plusButton.tag = indexPath.row
            cell.plusButton.addTarget(self, action: #selector(clickpluseButton(sender:)), for: .touchUpInside)
            cell.minusButton.tag = indexPath.row
            cell.minusButton.addTarget(self, action: #selector(clickminusButton(sender:)), for: .touchUpInside)
            cell.favButton.tag = indexPath.row
               cell.favButton.addTarget(self, action: #selector(clickFavButton(sender:)), for: .touchUpInside)
            
            return cell
            
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            if selectCategoryIndex == indexPath.row {
                cell.BackView.backgroundColor = UIColor.SecondaryColor()
            }else{
                cell.BackView.backgroundColor = UIColor.white
            }
            cell.CategoryName.text = subcategory[indexPath.row].subcategory_name
            cell.BackView.viewSetcornerRadius2(radius: 8,showShadow: false)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == ProductCollectionView {
            let collectionViewWidth = collectionView.bounds.width
            return CGSize(width:collectionViewWidth / 2.1, height:  self.view.frame.width / 1.9)
        }
        else{
            let collectionViewWidth = collectionView.bounds.width
            return CGSize(width:collectionViewWidth/3.8, height:  self.view.frame.width / 10)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == ProductCollectionView {
            
            return UIEdgeInsets(top:1, left: 2, bottom:4, right: 2)
        }
        else{
            return UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectCategoryIndex = indexPath.row
        if collectionView == CategoryNameCollectionView {
            callProductListWithFilterEndPoint(index: indexPath.row)
            
        }else{
            if !(mProductData[indexPath.row].is_out_of_stock ?? true) ?? true {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as? ProductDetailsViewController
                vc?.categoryId = mProductData[indexPath.row].product_id ?? 0
                self.navigationController?.pushViewController(vc!, animated: true)
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == ProductCollectionView  {
            return 2
        }
        return 8
    }
    
    //MARK:- objc Func
    
    @objc func clickPicke(sender:UIButton){
        selectTagVaraiantList = sender.tag
        callVariantsList(index: selectTagVaraiantList)
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
    
    @objc func clickAddCart(sender:UIButton){
        selectAddCartIndex = sender.tag
       
        if mProductData[selectAddCartIndex].variants_list?.count == 0 {
            qty = mProductData[selectAddCartIndex].min_order_qty ?? 0
            bulkOrderQty = mProductData[selectAddCartIndex].bulk_order_qty ?? 0
            minOrderQty =  mProductData[selectAddCartIndex].min_order_qty ?? 0
        }
        else{
            if !(mProductData[selectAddCartIndex].variants_list?.isEmpty ?? true) {
                if let mVaraiantsList =  mProductData[selectAddCartIndex].variants_list {
                    
                    VaraiantsList = mVaraiantsList
                    qty = VaraiantsList[selectTagVaraiantList].min_order_qty ?? 0
                    bulkOrderQty = VaraiantsList[selectTagVaraiantList].bulk_order_qty ?? 0
                    minOrderQty =  VaraiantsList[selectTagVaraiantList].min_order_qty ?? 0
                }
            }
            else{
                qty = mProductData[selectAddCartIndex].min_order_qty ?? 0
                bulkOrderQty = mProductData[selectAddCartIndex].bulk_order_qty ?? 0
                minOrderQty = mProductData[selectAddCartIndex].min_order_qty ?? 0
            }
        }
        ProductCollectionView.reloadData()
    }
    @objc func clickpluseButton(sender:UIButton){
        selectAddCartIndex = sender.tag
        qty += bulkOrderQty == 0 ? 1:bulkOrderQty
        ProductCollectionView.reloadData()
    }
    
    @objc func clickminusButton(sender:UIButton){
        qty -= bulkOrderQty == 0 ? 1:bulkOrderQty
        ProductCollectionView.reloadData()
    }
    
    @objc func clickFavButton(sender:UIButton){
        selectFavSelectIndex = sender.tag
        favCategoryId = "\(mProductData[sender.tag].product_id ?? 0)"
       
        productListMasterClass.addFavEndPoint(productId: favCategoryId) { mData in
            do {
            let jsonDecoder = JSONDecoder()
            let responseModel = try jsonDecoder.decode(AddFavBaseFile.self, from: mData)
                if responseModel.httpcode == "200" {
                    self.view.ShowMessage(message: "\(responseModel.message ?? "")")
                   
                }else{
                    self.view.ShowMessage(message: "\(responseModel.message ?? "")")
                }
                self.ProductCollectionView.reloadData()
            }catch(let Error){
                print("Error : \(Error.localizedDescription)")
            }
        }
    }
}
extension ProductListViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if isClickSort {
           return Sort.count
        }else{
            return VaraiantsList.count
        }
       
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if isClickSort{
            return Sort[row]
        }else{
            return VaraiantsList[row].combination
        }
       
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        combination = VaraiantsList[row].combination ?? ""
        
        print(VaraiantsList[row].combination)
        ProductCollectionView.reloadData()
    }
}

extension String {
    
    func highlightWordsIn(highlightedWords: String, attributes: [[NSAttributedString.Key: Any]]) -> NSMutableAttributedString {
        let range = (self as NSString).range(of: highlightedWords)
        let result = NSMutableAttributedString(string: self)
        
        for attribute in attributes {
            result.addAttributes(attribute, range: range)
        }
        return result
    }
}



