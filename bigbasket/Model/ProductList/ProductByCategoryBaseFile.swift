//
//  ProductByCategoryBaseFile.swift
//  bigbasket
//
//  Created by Deepu S on 26/10/22.
//

import Foundation
struct ProductByCategoryBaseFile : Codable {
    let httpcode : Int?
    let status : String?
    let page : String?
    let data : ProductByCategoryData?

    
}

struct ProductByCategoryData : Codable {
    let products : [ProductByCategoryProducts]?
    let total_products : Int?
    let currency : String?
}

struct  ProductByCategoryProducts : Codable {
    let product_id : Int?
    let product_name : String?
    let category_id : Int?
    let category_name : String?
    let subcategory_id : Int?
    let subcategory_name : String?
    //let brand_id : Int?
    let brand_name : String?
    let product_type : String?
    let min_order_qty : Int?
    let bulk_order_qty : Int?
   // let offer_name : Bool?
   // let discount_type : Bool?
   // let offer : Bool?
    let actual_price : String?
   // let offer_price : Bool?
    let stock : String?
    let is_out_of_stock : Bool?
    let out_of_stock_selling : String?
   // let short_description : String?
    //let tag : [String]?
    let rating : Int?
    let is_rating : Int?
    let total_reviews : Int?
    let image : [Image]?
    let variants_list : [Variants_list]?
    //let offers : [Offers]?
}

struct Offers : Codable {
    let offer_name : String?
    let product_id : Int?
    let url : String?
}
