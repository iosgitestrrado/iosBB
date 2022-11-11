

import UIKit
import FloatRatingView

class ProductDetailsViewController: UIViewController {
    
    @IBOutlet weak var progresBarOne: UIProgressView!
    @IBOutlet weak var progresBarTwo: UIProgressView!
    @IBOutlet weak var progresBarThree: UIProgressView!
    @IBOutlet weak var progresBarFour: UIProgressView!
    @IBOutlet weak var progresBarFive: UIProgressView!
    
    @IBOutlet weak var oneStarLabel: UILabel!
    @IBOutlet weak var twoStarLabel: UILabel!
    @IBOutlet weak var threeStarLabel: UILabel!
    @IBOutlet weak var FourStareLabel: UILabel!
    @IBOutlet weak var fiveStarelabel: UILabel!
    @IBOutlet weak var RatingView: FloatRatingView!
    @IBOutlet weak var noOfReviewandRating: UILabel!
    @IBOutlet weak var totalRatingRiview: UILabel!
    @IBOutlet weak var backViewCustomerReviews: UIView!
    @IBOutlet weak var selectViewDetails: UIView!
    @IBOutlet weak var selectViewCustomerReviews: UIView!
    @IBOutlet weak var AddCartButton: UIButton!
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
    var review = [mReview]();
    var rateRange :rate_range_ios?
    var productId = 0
    var qty:Int = 1
    var mimQty = 0
    var bulkQuantity = 0
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
        backViewCustomerReviews.isHidden = true
        pickerView.delegate = self
        pickerView.dataSource = self
        QtyTextField.inputView = pickerView
        ProductCollectionView.delegate = self
        ProductCollectionView.dataSource = self
        SimilarItemsCollectionView.dataSource = self
        SimilarItemsCollectionView.dataSource = self
        CustomerViewedCollectionView.dataSource = self
        CustomerViewedCollectionView.delegate = self
        AddCartButton.isEnabled = false
        self.StartSpiner()
        productDetailsMasterClass.ProductDetailsEndPoint(categoryId: categoryId) { [self] mData in
            self.StopSpiner()
            do{
                print(String(data: mData, encoding: .utf8) ?? "#nill")
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(ProductDetailBase.self, from: mData)
                if responseModel.httpcode == 200 {
                    if let mproduct = responseModel.data?.product {
                        self.product = mproduct
                        self.productId =  self.product?.product_id ?? 0
                        self.bulkQuantity = self.product?.bulk_quantity ?? 0
                        self.eachAmount =  Double(self.product?.actual_price?.replacingOccurrences(of: ",", with: "") ?? "0.0") ?? 0.0
                        self.TotalAmountLabel.text = "\(self.totalAmount) \(Currency)"
                        self.QtyLabel.text = "\(self.qty)"
                        self.totalRatingRiview.text = "\(self.product?.rating ?? 0)"
                        self.RatingView.rating = Double(self.product?.rating ?? 0)
                        self.noOfReviewandRating.text = "\(self.product?.total_reviews ?? 0) Reviews & \(self.product?.rating ?? 0) Rating"
                        
                        if self.product?.is_out_of_stock ?? false{
                            
                            if let attributedTitle = self.AddCartButton.attributedTitle(for: .normal) {
                                let mutableAttributedTitle = NSMutableAttributedString(attributedString: attributedTitle)
                                mutableAttributedTitle.replaceCharacters(in: NSMakeRange(0, mutableAttributedTitle.length), with: "Out of stack")
                                self.AddCartButton.setAttributedTitle(mutableAttributedTitle, for: .normal)
                            }
                            
                            if let reviews = responseModel.data?.review {
                                self.review = reviews
                            }
                            
                            self.AddCartButton.isEnabled = false
                        }
                        else{
                            
                            if let attributedTitle = self.AddCartButton.attributedTitle(for: .normal) {
                                let mutableAttributedTitle = NSMutableAttributedString(attributedString: attributedTitle)
                                mutableAttributedTitle.replaceCharacters(in: NSMakeRange(0, mutableAttributedTitle.length), with: "Add Cart")
                                self.AddCartButton.setAttributedTitle(mutableAttributedTitle, for: .normal)
                            }
                            
                            //self.AddCartButton.isEnabled = true
                        }
                    }
                    
                    if let mrateRange = responseModel.data?.rate_range_ios {
                        
                        self.rateRange = mrateRange
                        self.oneStarLabel.text = "\(self.rateRange?.oneStar ?? 0)"
                        self.twoStarLabel.text =  "\(self.rateRange?.twoStar ?? 0)"
                        self.threeStarLabel.text =  "\(self.rateRange?.threeStar ?? 0)"
                        self.FourStareLabel.text =  "\(self.rateRange?.fourStar ?? 0)"
                        self.fiveStarelabel.text =  "\(self.rateRange?.fiveStar ?? 0)"
                        
                        let oneStar = self.rateRange?.oneStar ?? 0
                        let twoStar = self.rateRange?.twoStar ?? 0
                        let threeStar = self.rateRange?.threeStar ?? 0
                        let fourStar = self.rateRange?.fourStar ?? 0
                        var fiveStar  = self.rateRange?.fiveStar ?? 0
                        
                        
                        self.progresBarOne.progress =  Float(oneStar)
                        self.progresBarTwo.progress = Float(twoStar)
                        self.progresBarThree.progress = Float(threeStar)
                        self.progresBarFour.progress = Float(fourStar)
                        self.progresBarFive.progress = Float(fiveStar)
                        
                        
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
                            self.productId = self.varaiantsList[0].pro_id ?? 0
                            self.mimQty = self.varaiantsList[0].min_order_qty ?? 0
                            self.qty = self.varaiantsList[0].min_order_qty ?? 0
                            self.QtyLabel.text = "\(self.qty)"
                            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string:"\(self.varaiantsList[0].actual_price ?? "0.0") \(Currency)")
                            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
                            
                            if self.varaiantsList[0].offer_price  == "0.00"{
                                self.offerPriceBackView.isHidden = true
                                self.ProductPriceLabel.text = "\(self.varaiantsList[0].actual_price ?? "0.0") \(Currency)"
                            }else{
                                self.ProductPriceLabel.attributedText = attributeString
                                self.offerPriceBackView.isHidden = false
                                
                            }
                            
                            self.offerPriceLabel.text = "\(self.varaiantsList[0].offer_price ?? "0.0" ) \(Currency)"
                            self.offerLabel.text = "\(self.varaiantsList[0].offer ?? "0.0" )"
                        }
                        else{
                            self.productId = self.product?.product_id ?? 0
                            self.mimQty = self.product?.minimum_quantity ?? 0
                            self.qty = self.product?.minimum_quantity ?? 0
                            self.QtyLabel.text = "\(self.qty)"
                            self.ProductPriceLabel.text = "\(self.product?.actual_price ?? "0.0")\(Currency)"
                            if product?.offer_price  == "0.00"{
                                self.offerLabel.text = ""
                                self.offerPriceBackView.isHidden = true
                                self.ProductPriceLabel.text = "\(self.product?.actual_price ?? "0.0") \(Currency)"
                            }else{
                                let attributeString: NSMutableAttributedString = NSMutableAttributedString(string:"\(self.product?.actual_price ?? "0.0") \(Currency)")
                                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
                                self.ProductPriceLabel.attributedText = attributeString
                                self.offerPriceBackView.isHidden = false
                            }
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
                    DispatchQueue.main.async {
                        if let cont = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController, !(cont.viewControllers.last is LoginPageViewController) {
                            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                            let myobject = storyBoard.instantiateViewController(withIdentifier: "LoginPageViewController")
                            cont.pushViewController(myobject, animated: true)
                            let domain = Bundle.main.bundleIdentifier!
                            UserDefaults.standard.removePersistentDomain(forName: domain)
                            UserDefaults.standard.synchronize()
                        }
                    }
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
    
    func UpdateProductDetail(mproduct:Product,mvariants:Variants_list){
        
    }
    func goToCart (){
        if let tabBarController = self.navigationController?.tabBarController  {
            tabBarController.selectedIndex = 3
        }
    }
    @IBAction func clickCustomerReview(_ sender: Any) {
        
        selectViewDetails.isHidden = true
        selectViewCustomerReviews.isHidden = false
        DeatilBackView.isHidden = true
        backViewCustomerReviews.isHidden = false
    }
    
    @IBAction func clickDetails(_ sender: Any) {
        
        selectViewDetails.isHidden = false
        selectViewCustomerReviews.isHidden = true
        DeatilBackView.isHidden = false
        backViewCustomerReviews.isHidden = true
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
        
        productDetailsMasterClass.AddCart(productId: productId, quantity: self.qty) { [self] mData in
            print(String(data: mData, encoding: .utf8) ?? "#nill")
            do{
                
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(AddCartBaseFile.self, from: mData)
                if responseModel.httpcode == 200 {
                    goToCart()
                }
                else if responseModel.httpcode == 400 {
                    self.view.ShowMessage(message: responseModel.message ?? "")
                }
            }catch(let Error){
                print("#Error \(Error.localizedDescription)")
            }
            
        }
    }
    
    @IBAction func clickPluse(_ sender: Any) {
        qty += bulkQuantity == 0 ? 1:bulkQuantity
        AddCartButton.isEnabled = qty > 0 ? true:false
        QtyLabel.text = "\(qty)"
        TotalAmountLabel.text = "\(totalAmount)  "
    }
    
    
    @IBAction func clickMinusButton(_ sender: Any) {
        if qty > mimQty {
            qty -= bulkQuantity == 0 ? 1:bulkQuantity
            QtyLabel.text = "\(qty)"
            TotalAmountLabel.text = "\(totalAmount) \(Currency)"
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
        productId = varaiantsList[row].pro_id ?? 0
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
            if !(relativeProducts[indexPath.row].image?.isEmpty ?? true) {
                
                if let url = URL(string: relativeProducts[indexPath.row].image?[0].image ?? ""){
                    cell.ProductImage.sd_setImage(with: url)
                }
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
            cell.QtyLabel.text = "Min Qty \(qty)"
            //            QtyLabel.text = "\(product?.minimum_quantity ?? 0)"
            //            mimQty = product?.minimum_quantity ?? 0
            //            qty = product?.minimum_quantity ?? 0
            
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
