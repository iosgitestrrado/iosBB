//
//  signupMasterClass.swift
//  bigbasket
//
//  Created by Deepu S on 23/08/22.
//

import Foundation
struct OtpVerificationMasterClass{
    
    
    let Otp1:String
    let Otp2:String
    let Otp3:String
    let Otp4:String
    let Otp5:String
    let countryCode:String
    let phoneNumber:String
   
    
    init( countryCode:String? = nil,
          phoneNumber:String? = nil,
          Otp1 : String? = nil,
          Otp2 : String? = nil,
          Otp3 : String? = nil,
          Otp4 : String? = nil,
          Otp5 : String? = nil
          
    ){
        self.Otp1 = Otp1 ?? ""
        self.Otp2 = Otp2 ?? ""
        self.Otp3 = Otp3 ?? ""
        self.Otp4 = Otp4 ?? ""
        self.Otp5 = Otp5 ?? ""
        self.countryCode = countryCode ?? ""
        self.phoneNumber = phoneNumber ?? ""
    }
    
    func isOtpVerification() throws->Bool  {
        
        if(!self.Otp1.isEmpty && !self.Otp2.isEmpty && !self.Otp3.isEmpty && !self.Otp4.isEmpty){
            return true
            
        }else{
            return false
            throw ErrorMsg.invalidOtp
        }
        
    }
    
    func RegisterOtpVerificationEndPoint(completion:@escaping (Data)->Void){
        let param = ["otp":"\(Otp1)\(Otp2)\(Otp3)\(Otp4)",
                     "country_code":countryCode,
                     "phone_number":phoneNumber]
        
        NetworkingHandler.Post(url: registerVerifyOtpUrl, param: param) { mdata in
            completion(mdata)
            
        } failure: {
            Error in
        }
    }
    
    func LoginOtpVerificationEndPoint(completion:@escaping (Data)->Void){
        let param = ["otp":"\(Otp1)\(Otp2)\(Otp3)\(Otp4)",
                     "country_code":countryCode,
                     "phone_number":phoneNumber,
                     "deviceToken":"12345",
                     "deviceId":"123458800",
                     "deviceName":"iPhone",
                     "os":"ios"]
        
        NetworkingHandler.Post(url:LoginVerifyOtpUrl, param: param) { mdata in
            completion(mdata)
            
        } failure: {
            Error in
        }
    }
    
    //MARK: - Resend OTP Endpoint
    
    func ResendOtpEndPoint(completion:@escaping (Data)->Void){
        let param = [
            "country_code":countryCode,
            "phone_number":phoneNumber]
        
        NetworkingHandler.Post(url: registerVerifyOtpUrl, param: param) { mdata in
            completion(mdata)
            
        } failure: {
            Error in
        }
    }
}

