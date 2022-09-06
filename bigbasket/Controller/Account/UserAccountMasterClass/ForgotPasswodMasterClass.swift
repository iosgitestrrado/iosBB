//
//  ForgotPasswodMasterClass.swift
//  bigbasket
//
//  Created by Deepu S on 26/08/22.
//

import Foundation
import UIKit
struct ForgotPasswordMasterClass{
    let phoneNumber:String
    let contryCode:String
    
    
    func loginCredentialsVerification() throws->Bool  {
        
        if(self.phoneNumber.isValidPhone()){
            if (!self.contryCode.isEmpty){
                return true
            }else{
                throw ErrorMsg.invalidPassword
            }
        }else{
    throw ErrorMsg.invalidPhoneNumber
        }
    }
    
    func loginEndPoint(completion:@escaping (Data)->Void){

let param = ["country_code":contryCode,
"phone_number":phoneNumber]
        NetworkingHandler.Post(url: loginUrl, param: param) { mdata in
            completion(mdata)
        } failure: { Error in
            
        }
    }
}
