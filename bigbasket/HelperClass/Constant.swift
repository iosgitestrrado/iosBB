

import Foundation
import UIKit

enum BaseUrl: String
{
    case Dev = "https://dev-bigbasket.estrradoweb.com/api/customer/"
    case Live = "live"
    case Qa = "https://qa-bigbasket.estrradoweb.com/api/customer/"

}

struct CoupanData{
    var couponCode :String?
    var couponId: Int?
    var couponTitle:String?
}



var Currency = "SAR"
var mcouponCode  = ""
var mcouponId = 0
var mcouponTitle = ""
var mcouponOffer = ""

let UrlType = "\(BaseUrl.Qa.rawValue)";
let loginUrl = "\(UrlType)login/send/otp"
let loginEmailUrl = "\(UrlType)login"
let signUpUrl = "\(UrlType)register"
let registerVerifyOtpUrl = "\(UrlType)register/verify/otp"
let resendOtpUrl = "\(UrlType)register/verify/otp"
let ResendOtpUrl = "\(UrlType)login/send/otp"
let ForgotPasswordUrl = "\(UrlType)/login/forgot/password"
let LoginVerifyOtpUrl = "\(UrlType)login/verify/otp"
let HomePageUrl = "\(UrlType)home"
let ProductListUrl = "\(UrlType)product-list-filter"
let ProductListSubcategoryUrl = "\(UrlType)subcategory"
let productDetailUrl = "\(UrlType)product-detail"
let addCartUrl = "\(UrlType)add-cart"
let cartUrl = "\(UrlType)cart"
let changeQtyUrl = "\(UrlType)cart/change-qty"
let deleteCartUrl = "\(UrlType)delete-cart"
let deleteAllCartUrl = "\(UrlType)delete-cart-all"
let PlaceOrderUrl = "\(UrlType)order/placeorder-ios"
let addCartProductListUrl = "\(UrlType)cart-qty-by-product-id"
let couponListUrl = "\(UrlType)coupon-list"
let applyCouponUrl = "\(UrlType)cart/apply-coupon"
let CategorySubCatURL = "\(UrlType)cat-subcat"
let ProfileURL = "\(UrlType)profile"
let addressUrl = "\(UrlType)address"
let addFavUrl = "\(UrlType)add/wishlist"


enum fontName:String
{
    case poppinsMedium = "POPPINS-MEDIUM"
    case Poppinsregular = "POPPINS-REGULAR"
}

let defaultImage = UIImage(named: "noti")!

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

