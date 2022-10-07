//
//  CartListBaseFile.swift
//  bigbasket
//
//  Created by Deepu S on 27/09/22.
//

import Foundation

struct CartListBase : Codable {
    let httpcode : Int?
    let status : String?
    let message : String?
    let data : CartListData?

}

struct CartListData : Codable {
    let cart_count : Int?
    let product : [Product]?
    let before_checkout_products : [Before_checkout_products]?
    let currency : String?
    let wallet_balance : Bool?
    let points : Int?
    let reward : [String]?
    let total_cost : String?
    let discount : String?
    let total_tax : String?
    let grand_total : String?
}

struct Before_checkout_products : Codable {
    let product_id : Int?
    let product_name : String?
//    let category_id : Int?
//    let is_rating : Int?
//    let category_name : String?
//    let subcategory_id : Int?
//    let subcategory_name : String?
//    let brand_id : String?
//    let brand_name : String?
//    let short_description : String?
//    let long_description : String?
//    let content : String?
//    let product_type : String?
//    let min_order_qty : Int?
//    let bulk_order_qty : Int?
//    let offer_name : Bool?
//    let discount_type : Bool?
//    let offer : Bool?
    let actual_price : String?
//    let offer_price : Bool?
//    let stock : Int?
//    let is_out_of_stock : Bool?
//    let out_of_stock_selling : Bool?
//    let rating : Int?
//    let total_reviews : Int?
    let image : [CartListImage]?
   // let variants_list : [String]?

}

struct CartListImage : Codable {
    let image : String?
    let thumbnail : String?
}
