//
//  ProductFilterListBaseFile.swift
//  bigbasket
//
//  Created by Deepu S on 23/09/22.
//

import Foundation
struct ProductFilterListBaseFile : Codable {
    let httpcode : Int?
    let status : String?
    let page : String?
    let data : ProductFilterListData?
}

struct ProductFilterListData : Codable {
    let products : [Products]?
    let total_products : Int?
    let currency : String?
}


struct Products : Codable {
    let product_id : Int?
    let product_name : String?
    let category_id : Int?
    let category_name : String?
    let subcategory_id : Int?
    let subcategory_name : String?
    let brand_id : String?
    let brand_name : String?
    let product_type : String?
    let min_order_qty : String?
    let bulk_order_qty : String?
    let offer_name : Bool?
    let discount_type : Bool?
    let offer : Bool?
    let actual_price : String?
    let offer_price : Bool?
    let stock : String?
    let is_out_of_stock : String?
    let out_of_stock_selling : String?
    let short_description : String?
    let tag : [String]?
    let is_rating : Int?
    let rating : Int?
    let total_reviews : Int?
    let image : [Image]?
    let variants_list : [Variants_list]?
    let config_prd : [Config_prd]?
    let offers : [String]?

}

struct Image : Codable {
    let image : String?
    let thumbnail : String?
}

struct Variants_list : Codable {
    let pro_id : Int?
    let combination : String?
    let stock : Int?
    let is_out_of_stock : Bool?
    let out_of_stock_selling : Bool?
    let min_order_qty : Int?
    let bulk_order_qty : Int?
    let image : [String]?
    let offer_name : Bool?
    let discount_type : Bool?
    let offer : Bool?
    let actual_price : String?
    let offer_price : Bool?

    
}

struct Config_prd : Codable {
    let attr_id : Int?
    let product_id : Int?
    let min_order : Int?
    let bulk_order : Int?
    let attr_name : String?
    let attr_value : String?
    let attribute_image : String?
    let image : [String]?
    let sub_attributes : [Sub_attributes]?
}

struct Sub_attributes : Codable {
    let attr_id : Int?
    let product_id : Int?
    let attr_name : String?
    let attr_value : String?
    let image : [String]?
    let actual_price_quote : String?
    let actual_price : String?
    let sale_price : String?
    let special_ofr_price : String?
    let stock : Int?
    let sku : String?
    let is_out_of_stock : Bool?
    let out_of_stock_selling : Bool?

}
