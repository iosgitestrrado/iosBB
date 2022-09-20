

import Foundation
import UIKit

enum BaseUrl:String
{
case deve = "https://dev-bigbasket.estrradoweb.com/api/customer/"
case live = "live"
case testing = "test"
}

let UrlType = "\(BaseUrl.deve.rawValue)";

let loginUrl = "\(UrlType)login/send/otp"
let signUpUrl = "\(UrlType)register"
let registerVerifyOtpUrl = "\(UrlType)register/verify/otp"
let resendOtpUrl = "\(UrlType)register/verify/otp"
let ResendOtpUrl = "\(UrlType)login/send/otp"
let ForgotPasswordUrl = "\(UrlType)/login/forgot/password"
let LoginVerifyOtpUrl = "\(UrlType)login/verify/otp"

let HomePageUrl = "\(UrlType)home"
let ProductListUrl = "\(UrlType)product-list-filter"

enum fontName:String
{
case poppinsMedium = "POPPINS-MEDIUM"
case Poppinsregular = "POPPINS-REGULAR"

}


//MARK: - Language

enum Language: String {
    case Arabic
    case Hindi
    case English
    
    var keyValue: String{
        switch self {
        case .Arabic:
            return "ar"
        case .Hindi:
            return "hi"
        case .English:
            return "en"
        }
    }
    var lowCaseKeyValue: String{
        switch self {
        case .Arabic:
            return "arabic"
        case .Hindi:
            return "hindi"
        case .English:
            return "english"
        }
    }
    
}

