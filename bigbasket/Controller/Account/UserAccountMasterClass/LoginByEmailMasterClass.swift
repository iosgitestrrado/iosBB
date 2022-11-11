//
//  LoginByEmailMasterClass.swift
//  bigbasket
//
//  Created by Deepu S on 21/09/22.
//

import Foundation
import Foundation
import SwiftyJSON
import CoreMedia
import Toast_Swift
struct LoginByEmailMasterClass{
    let EmailId:String
    let Password:String
    
    func loginCredentialsVerification() throws->Bool  {
        
        if(self.EmailId.isValidEmail()){
            if (!self.Password.isEmpty){
                return true
            }else{
                throw ErrorMsg.invalidPassword
            }
        }else{
            throw ErrorMsg.invalidEmailAddress
        }
    }
    
    func loginEmailEndPoint(completion:@escaping (Data)->Void){
        
        let randomInt = Int.random(in: 0..<10)
let param = ["input":EmailId,
             "password":Password, 
             "deviceToken":"\(randomInt)",
             "deviceId":"\(randomInt)",
             "deviceName":"iPhone",
             "os":"iOS"]
        NetworkingHandler.Post(url:loginEmailUrl, param: param) { mdata in
            completion(mdata)
        } failure: { Error in
            
        }
    }
}
