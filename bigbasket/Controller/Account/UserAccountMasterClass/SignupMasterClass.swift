//
//  signupMasterClass.swift
//  bigbasket
//
//  Created by Deepu S on 23/08/22.
//

import Foundation
struct SignUpMasterClass{
    let email:String
    let name:String
    let phoneNumber:String
    let countryCode:String
    let password:String
    let passwordConfirmation:String
    
    func loginCredentialsVerification() throws->Bool  {
        
        if(self.phoneNumber.isValidPhone()){
            if (self.phoneNumber.isValidPhone()    ){
                if password == passwordConfirmation {
                    return true
                }else{
                    throw ErrorMsg.passworNotMatch
                }
            }else{
                throw ErrorMsg.invalidPassword
            }
        }else{
            throw ErrorMsg.invalidPhoneNumber
        }
    }
    
    func RegisterEndPoint(completion:@escaping (Data)->Void){
        let param = ["first_name":name,
                     "email":email,
                     "country_code":countryCode,
                     "phone_number":phoneNumber,
                     "password":password,
                     "password_confirmation":passwordConfirmation]
        
        NetworkingHandler.Post(url: signUpUrl, param: param) { mdata in
            completion(mdata)
            
        } failure: {
            Error in
        }
    }
}
/*
 first_name:hi
 email:rekharajan1993@gmail.com
 country_code:91
 phone_number:7902232911
 */
