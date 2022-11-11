//
//  couponListBase.swift
//  bigbasket
//
//  Created by Deepu S on 19/10/22.
//

import Foundation
struct couponListBase : Codable {
    let httpcode : Int?
    let status : String?
    let message : String?
    let coupon_list : [Coupon_list]?
}
struct Coupon_list : Codable {
    let coupon_id : Int?
    let title : String?
    let desc : String?
    let offer : String?
    let coupon_code : String?
    let minimum_purchase : Int?
    let offer_type : String?
    let offer_value : Int?
    let offer_value_in : String?
    let purchase_type : String?
    let previous_order_count : Int?
    let previous_order_amount : String?

}
