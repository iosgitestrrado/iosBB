

import Foundation
import Foundation
import Foundation
import SwiftyJSON
import CoreMedia

struct PlaceOrder {
    
    var total_cost : Double
    var  total_tax: Double
    var  is_coupon: Bool
    var   coupon_id: String
    var   discount_type:String
    var   discount_amt: String
    var   packing_charge: String
    var    shipping_charge: String
    var    payment_type: Int
    var    message: String
    var    access_token: String
    var   currency_code:String
    var   lang_id: String
    var    invite_coupon_id:String
    var   total_amt:Double
    var   e_money_amt:String
    var   reward_id:String
    var   reward_amt:String
    var   address_id: Int
    var    branch_id:String
    var   device_id: String
    var   page_url: String
    var    os_type: String
    
}
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
    func couponList(completion:@escaping (Data)->Void) {
        
        let param = ["access_token":userDefaultClass.getUserDefaultString(key: .accessToken),
        ] as [String : Any]
        NetworkingHandler.Post(url: couponListUrl, param: param) { mdata in
            print(JSON(mdata))
            completion(mdata)
        } failure: { Error in
        }
    }
    
    func callAddressList(completion:@escaping (Data)->Void){
        
        let param = [  "access_token":userDefaultClass.getUserDefaultString(key: .accessToken),
        ] as [String : Any]
        NetworkingHandler.Post(url: addressUrl, param: param) { mdata in
            print(JSON(mdata))
            completion(mdata)
        } failure: { Error in
            
        }
    }
    func applyCoupon(CoupenCode:String,completion:@escaping (Data)->Void) {
        
        let param = [  "access_token":userDefaultClass.getUserDefaultString(key: .accessToken),"coupon_code":CoupenCode,
        ] as [String : Any]
        NetworkingHandler.Post(url: applyCouponUrl, param: param) { mdata in
            print(JSON(mdata))
            completion(mdata)
        } failure: { Error in
            
        }
    }
    
    func DeleteCart(CartId:Int,completion:@escaping (Data)->Void) {
        
        let param = [  "access_token":userDefaultClass.getUserDefaultString(key: .accessToken),
                       "cart_type":"App",
                       "cart_id":CartId,
        ] as [String : Any]
        NetworkingHandler.Post(url:deleteCartUrl, param: param) { mdata in
            print(JSON(mdata))
            completion(mdata)
        } failure: { Error in
            
        }
    }
    
    func DeleteAllCart(completion:@escaping (Data)->Void) {
        
        let param = [  "access_token":userDefaultClass.getUserDefaultString(key: .accessToken)
                       
        ] as [String : Any]
        NetworkingHandler.Post(url:deleteAllCartUrl, param: param) { mdata in
            print(JSON(mdata))
            completion(mdata)
        } failure: { Error in
            
        }
    }
    
    func PlaceOrder(placeOrder:PlaceOrder,completion:@escaping (Data)->Void) {
        
        let param = [  "total_cost": placeOrder.total_cost,
                       "total_tax": placeOrder.total_tax,
                       "is_coupon": placeOrder.is_coupon,
                       "coupon_id": placeOrder.coupon_id,
                       "discount_type":placeOrder.discount_type,
                       "discount_amt": placeOrder.discount_amt,
                       "packing_charge": placeOrder.packing_charge,
                       "shipping_charge": placeOrder.shipping_charge,
                       "payment_type": placeOrder.payment_type,
                       "message": placeOrder.message,
                       "access_token": placeOrder.access_token,
                       "currency_code":placeOrder.currency_code,
                       "lang_id": placeOrder.lang_id,
                       "invite_coupon_id":placeOrder.invite_coupon_id,
                       "total_amt":placeOrder.total_amt,
                       "e_money_amt":placeOrder.e_money_amt,
                       "reward_id":placeOrder.reward_id,
                       "reward_amt":placeOrder.reward_amt,
                       "address_id": placeOrder.address_id,
                       "branch_id":placeOrder.packing_charge,
                       "device_id": placeOrder.device_id,
                       "page_url": placeOrder.page_url,
                       "os_type": placeOrder.os_type
        ] as [String : Any]
        print("Param\(param)")
        
        NetworkingHandler.Post(url:PlaceOrderUrl, param: param) { mdata in
            print("**\(String(data: mdata, encoding: .utf8))")
            print(JSON(mdata))
            completion(mdata)
        } failure: { Error in
            print(Error.localizedDescription)
        }
    }
}



