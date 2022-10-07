//
//  NetworkingHandler.swift
//  bigbasket
//
//  Created by Deepu S on 22/08/22.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

class NetworkingHandler:NSObject {
  
    
    static func Post(url:String,param:[String:Any],success: @escaping (Data)->Void,failure :@escaping (Error)->Void){
        print("##URL \(url)")
        print("###param \(param)")
      
        let headers : HTTPHeaders = [
            "Authorization": "",
            "Accept": "application/json",
            "Content-Type":"application/json"
        ]
        
        AF.request(url, method: .post, parameters: param,encoding: JSONEncoding.default,headers: nil).responseJSON { response in             
            do{
               
                guard let responseData = response.data else {
                    print("Response : \(response.result)")
                    return
                }
                switch  response.result{
                case .success :
                    let mdata = JSON(response.data)
                    print("#Json\(mdata)")
                    
                    success(responseData)
                    break
                case .failure(let error):
                    failure(error)
                }
            }catch{
                print("##\(error)")
            }
        }
    }
}

