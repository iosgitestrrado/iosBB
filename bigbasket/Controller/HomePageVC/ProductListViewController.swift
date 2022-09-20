//
//  ProductListViewController.swift
//  bigbasket
//
//  Created by Deepu S on 19/09/22.
//

import UIKit
import SwiftyJSON

class ProductListViewController: UIViewController {
    
    
    @IBOutlet weak var ReviewLabel: UILabel!
    @IBOutlet weak var ProductCollectionView: UICollectionView!
    @IBOutlet weak var CategoryNameCollectionView: UICollectionView!
    @IBOutlet weak var SearchSubBackView: UIView!
    @IBOutlet weak var SearchBackView: UIView!
    
    var mProductData = [ProductsData]();
    
    
    let categoryId = ""
    let subcategoryId = ""
    let brandId = ""
    let lowToHigh = ""
    let highToLow = ""
    let latest = ""
    let popular = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SearchBackView.viewRoundCorners(with: .both, radius: 5)
        SearchSubBackView.viewRoundCorners(with: .both, radius: 5)
        CategoryNameCollectionView.delegate = self
        CategoryNameCollectionView.dataSource = self
        ProductCollectionView.delegate = self
        ProductCollectionView.dataSource = self
        CategoryNameCollectionView.reloadData()
        callEndPoint()
        
    }
    
    func callEndPoint(){
        let productListMasterClass = ProductListMasterClass()
        
        productListMasterClass.ProductListEndPoint(categoryId: self.categoryId, subcategoryId: self.subcategoryId, brandId: self.brandId, lowToHigh: self.lowToHigh, highToLow: self.highToLow, latest: self.latest, popular: self.popular) { mData in
            
            do{
               
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(ProductListingBase.self, from: mData)
                if let productData = responseModel.data?.products {
                    self.mProductData = productData
                    self.ProductCollectionView.reloadData()
                }
                   
                    print("#Response \( JSON(responseModel.httpcode ?? ""))" )
        }
            catch{}
    }
    
    
    } }

extension  ProductListViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == ProductCollectionView {
            return mProductData.count
            
        }
        else  {
            return 5
            
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
            cell.ReviewLabel.text = "(8 Rating & \(mProductData[indexPath.row].total_reviews ?? 0) Review"
            cell.RatingLabel.text = "\(mProductData[indexPath.row].rating ?? 0)"
            cell.PriceLabel.text = "\(mProductData[indexPath.row].actual_price ?? "0.0") Sar"
            cell.BackView.viewRoundCorners(with: .both, radius: 2)
            cell.BackViewAddButton.viewRoundCorners(with: .both, radius: 1)
            return cell
            
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            
            cell.CategoryName.text = "Test\(indexPath.row)"
            return cell
        }}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == ProductCollectionView {
            let collectionViewWidth = collectionView.bounds.width
            return CGSize(width:collectionViewWidth / 2.1, height:  self.view.frame.width / 2)
        }
        else{
            let collectionViewWidth = collectionView.bounds.width
            return CGSize(width:collectionViewWidth/5, height:  self.view.frame.width / 5)
        }}
    
    
}
