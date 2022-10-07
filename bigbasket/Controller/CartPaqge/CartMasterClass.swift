//
//  CartMasterClass.swift
//  bigbasket
//
//  Created by Deepu S on 27/09/22.
//

import Foundation


import Foundation
import Foundation
import SwiftyJSON
import CoreMedia
struct  CartMasterClass{
    let userDefaultClass = UserDefaultClass();
    //MARK: - Endpoint
    func getCartEndPoint(completion:@escaping (Data)->Void){
        
        let param = ["access_token":userDefaultClass.getUserDefaultString(key: .accessToken),
                         "lang_id":"1",
                         "device_id":"54655656fdf",
                         "page_url":"cart/us/img",
                         "os_type":"WEB"
        ] as [String : Any]
        NetworkingHandler.Post(url:cartUrl, param: param) { mdata in
            print(JSON(mdata))
            completion(mdata)
        } failure: { Error in
            
        }
    }
    
    func AddCart(CartId:Int,quantity:Int,completion:@escaping (Data)->Void) {
        
        let param = [  "access_token":userDefaultClass.getUserDefaultString(key: .accessToken),
                       "quantity": quantity,
                       "cart_type":"App",
                       "cart_id":CartId,
        ] as [String : Any]
                NetworkingHandler.Post(url: changeQtyUrl, param: param) { mdata in
                    print(JSON(mdata))
                    completion(mdata)
                } failure: { Error in
                    
                }
        
    }
    
}
