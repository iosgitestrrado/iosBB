//
//  ProductDetailsMasterClass.swift
//  bigbasket
//
//  Created by Deepu S on 22/09/22.
//

import Foundation

import SwiftyJSON

struct ProductDetailsMasterClass{
    let userDefaultClass = UserDefaultClass();
    func ProductDetailsEndPoint(categoryId:Int,completion:@escaping (Data)->Void){
        
let param = [ "lang_id": 1,
              "access_token": userDefaultClass.getUserDefaultString(key: .accessToken),
              "device_id": "54655656fdf",
              "page_url": "https://products/us/img",
              "os_type": "APP",
              "currency_code":"SAR",
              "id":categoryId
] as [String : Any]
        NetworkingHandler.Post(url: productDetailUrl, param: param) { mdata in
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
                NetworkingHandler.Post(url: addCartUrl, param: param) { mdata in
                    print(JSON(mdata))
                    completion(mdata)
                } failure: { Error in
                    
                }
        
    }
}
