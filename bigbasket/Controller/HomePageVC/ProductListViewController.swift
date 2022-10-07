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
    var subcategory = [Subcategory]();
    let productListMasterClass = ProductListMasterClass()
    
    var categoryId = "0"
    var categoryName = ""
    var subcategoryId = "0"
    var brandId = "0"
    var lowToHigh = "0"
    var highToLow = "0"
    var latest = "0"
    var popular = "0"
    var isShowSubcategory = false
    var HeaderName = "Product List"
    
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
        callProductListEndPoint()
        if #available(iOS 13.0, *) {
            UIApplication.shared.statusBarStyle = .darkContent
        } else {
          
        }
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
        HeaderNameLabel.text = HeaderName
        ProductCollectionTopConstrain.constant = isShowSubcategory ? 95:16
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //MARK: - Action
    
    
    @IBAction func clickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Func
    
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
                cell.Qty.isHidden = false
                cell.qtyBackView.isHidden = false
                cell.Qty.text = mProductData[indexPath.row].variants_list?[0].combination
            }else{
                cell.Qty.isHidden = true
                cell.qtyBackView.isHidden = true
            }
            cell.ProductName.text = mProductData[indexPath.row].product_name
            cell.ReviewLabel.text = "(\(mProductData[indexPath.row].rating ?? 0) Rating & \(mProductData[indexPath.row].total_reviews ?? 0) Review)"
            cell.RatingLabel.text = "\(mProductData[indexPath.row].rating ?? 0)"
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "180 SAR")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1.5, range: NSRange(location: 0, length: attributeString.length))
            cell.PriceLabel.attributedText = attributeString//"\(mProductData[indexPath.row].actual_price ?? "0.0") Sar"
            cell.offLabel.text = "48%\nOFF"
            cell.BackView.viewSetcornerRadius(radius: 8,showShadow: false)
            cell.offerPriceBackView.viewSetcornerRadius(radius:4,showShadow: false)
            cell.BackViewAddButton.viewSetcornerRadiusBlueColor(radius: 4,showShadow: false)
            return cell
            
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            
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
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as? ProductDetailsViewController
        vc?.categoryId = mProductData[indexPath.row].product_id ?? 0
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == ProductCollectionView  {
            return 2
       }
        return 8
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
