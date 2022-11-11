//
//  ProductListMasterClass.swift
//  bigbasket
//
//  Created by Deepu S on 19/09/22.
//

import Foundation
import SwiftyJSON

struct ProductListMasterClass{
    
    func ProductByCategoryListEndPoint(subUrl:String, categoryId:String,subcategoryId:String,brandId:String,lowToHigh:String,highToLow:String,latest:String,popular:String,completion:@escaping (Data)->Void){
        
        let param = [ "lang_id": 1,
                      "access_token": "",
                      "device_id": "54655656fdf",
                      "page_url": "https://products/us/img",
                      "os_type": "APP",
                      "limit": 30,
                      "offset": 0,
                      "category_id": categoryId,
                      "subcategory_id": subcategoryId,
                      "brand_id": brandId,
                      "low_to_high": lowToHigh,
                      "high_to_low": highToLow,
                      "latest": latest,
                      "popular": popular
        ] as [String : Any]
        NetworkingHandler.Post(url:"\(UrlType)\(subUrl)", param: param) { mdata in
            print(JSON(mdata))
            completion(mdata)
        } failure: { Error in
            
        }
    }
    func ProductListEndPoint(categoryId:String,subcategoryId:String,brandId:String,lowToHigh:String,highToLow:String,latest:String,popular:String,completion:@escaping (Data)->Void){
        
        let param = [ "lang_id": 1,
                      "access_token": userDefaultClass.getUserDefaultString(key: .accessToken),
                      "device_id": "54655656fdf",
                      "page_url": "https://products/us/img",
                      "os_type": "APP",
                      "limit": 30,
                      "offset": 0,
                      "category_id": categoryId,
                      "subcategory_id": subcategoryId,
                      "brand_id": brandId,
                      "low_to_high": lowToHigh,
                      "high_to_low": highToLow,
                      "latest": latest,
                      "popular": popular
        ] as [String : Any]
        NetworkingHandler.Post(url: ProductListUrl, param: param) { mdata in
            print(JSON(mdata))
            completion(mdata)
        } failure: { Error in
            
        }
    }
    
    func ProductListSubcategoryEndPoint(categoryId:String,completion:@escaping (Data)->Void){
        
        let param = [ "lang_id": 1,
                      "access_token": "",
                      "category_id": categoryId,
                      
        ] as [String : Any]
        NetworkingHandler.Post(url: ProductListSubcategoryUrl, param: param) { mdata in
            print(JSON(mdata))
            completion(mdata)
        } failure: { Error in
            
        }
    }
    
    func addFavEndPoint(productId:String,completion:@escaping (Data)->Void){
        
        let param = [ "lang_id": 1,
                      "access_token": userDefaultClass.getUserDefaultString(key: .accessToken),
                      "product_id": productId,
                      "type":"APP"] as [String : Any]
        NetworkingHandler.Post(url: addFavUrl, param: param) { mdata in
            print(JSON(mdata))
            completion(mdata)
        } failure: { Error in
            
        }
    }
    
    
    func AddNewCart(productId:Int,quantity:Int,completion:@escaping (Data)->Void) {
        
        let param = [  "access_token":userDefaultClass.getUserDefaultString(key: .accessToken),
                       "product_id":productId,
                       "quantity": quantity,
                       "cart_type":"App",
                       "prd_assign_id":""
        ] as [String : Any]
                NetworkingHandler.Post(url: addCartUrl, param: param) { mdata in
                    print(JSON(mdata))
                    completion(mdata)
                } failure: { Error in
                    
                }
        
    }
    
    func AddCart(productId:Int,quantity:Int,completion:@escaping (Data)->Void) {
        
        let param = [  "access_token":userDefaultClass.getUserDefaultString(key: .accessToken),
                       "product_id":productId,
                       "quantity": quantity,
                       "cart_type":"App",
                       "prd_assign_id":""
        ] as [String : Any]
        NetworkingHandler.Post(url: addCartProductListUrl, param: param) { mdata in
            print(JSON(mdata))
            completion(mdata)
        } failure: { Error in
            
        }
    }
}
