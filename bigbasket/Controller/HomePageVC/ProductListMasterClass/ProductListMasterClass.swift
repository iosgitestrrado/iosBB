//
//  ProductListMasterClass.swift
//  bigbasket
//
//  Created by Deepu S on 19/09/22.
//

import Foundation
import SwiftyJSON

struct ProductListMasterClass{
    func ProductListEndPoint(categoryId:String,subcategoryId:String,brandId:String,lowToHigh:String,highToLow:String,latest:String,popular:String,completion:@escaping (Data)->Void){
        
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
        NetworkingHandler.Post(url: ProductListSubcategory, param: param) { mdata in
            print(JSON(mdata))
            completion(mdata)
        } failure: { Error in
            
        }
    }
    
}
