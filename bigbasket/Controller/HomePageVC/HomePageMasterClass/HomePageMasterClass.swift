

import Foundation
import Foundation
import SwiftyJSON
import CoreMedia
struct HomePageMasterClass{
 
 //MARK: - Endpoint
func HomePageEndPoint(completion:@escaping (Data)->Void){
        
let param = ["lang_id":2,
             "access_token":"21RIT9QOUWFM1G",
             "device_id":"54655656fdf",
             "page_url":"/home",
             "os_type":"APP"
] as [String : Any]
        NetworkingHandler.Post(url: HomePageUrl, param: param) { mdata in
            print(JSON(mdata))
            completion(mdata)
        } failure: { Error in
            
        }
    }
        
}
