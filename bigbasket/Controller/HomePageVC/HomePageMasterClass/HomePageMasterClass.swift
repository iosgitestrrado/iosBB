

import Foundation
import Foundation
import SwiftyJSON
import CoreMedia
struct HomePageMasterClass{
    let userDefaultClass = UserDefaultClass();
 //MARK: - Endpoint
func HomePageEndPoint(completion:@escaping (Data)->Void){
        
    let param = ["lang_id": 1,
                 "access_token":userDefaultClass.getUserDefaultString(key: .accessToken) ,
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
