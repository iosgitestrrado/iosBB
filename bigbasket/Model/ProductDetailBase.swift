//
//  ProductDetailBase.swift
//  bigbasket
//
//  Created by Deepu S on 22/09/22.
//

import Foundation
struct ProductDetailBase : Codable {
    let httpcode : Int?
    let status : String?
    let message: String?
    let data : ProductDetailData?
}

struct ProductDetailData : Codable {
    let product : Product?
    let varaiants_list : [Varaiants_list]?
    let relative_products : [Relative_products]?
    let viewed_products : [Viewed_products]?
    let review : [String]?
    let total_review : Int?
    let rate_range : [String]?
   // let offer : [String]?
    let currency : String?
}

struct Varaiants_list : Codable {
    let pro_id : Int?
    let combination : String?
    let stock : Int?
    let is_out_of_stock : Bool?
    let out_of_stock_selling : Bool?
    let min_order_qty : Int?
    let bulk_order_qty : Int?
   // let image : [String]?
   // let offer_name : Bool?
   // let discount_type : Bool?
   // let offer : Bool?
    let actual_price : String?
    //let offer_price : Bool?
}


struct Product : Codable {
    let cart_id:Int?
    let quantity : Int?
    let unit_actual_price : Int?
    let total_actual_price : Int?
    let product_id : Int?
    let product_name : String?
    let product_type : String?
    let minimum_quantity : Int?
    let bulk_quantity : Int?
   // let offer_name : Bool?
  //  let discount_type : Bool?
   // let offer : Bool?
    let actual_price : String?
  //  let offer_price : Bool?
    let sku : String?
    let category_id : Int?
    let category_name : String?
    let subcategory_id : Int?
    let subcategory_name : String?
    //let brand_id : Int?
    let brand_name : String?
    let is_featured : Int?
    let short_description : String?
    let long_description : String?
    //let content : String?
    let specification : String?
    let quill_specification : String?
    let stock : Int?
    let is_out_of_stock : Bool?
    let out_of_stock_selling : Bool?
    let in_wishlist : Int?
    let tag : [String]?
    let image : [ProductDetaiImage]?
    let rating : Int?
    let total_reviews : Int?
}

struct ProductDetaiImage : Codable {
    let image : String?
    let thumbnail : String?
}
struct Relative_products : Codable {
    let product_id : Int?
    let product_name : String?
    let category_id : Int?
    let is_rating : Int?
    let category_name : String?
    let subcategory_id : Int?
    let subcategory_name : String?
   // let brand_id : String?
    let brand_name : String?
    let short_description : String?
    let long_description : String?
   // let content : String?
    let product_type : String?
  //  let min_order_qty : String?
   // let bulk_order_qty : String?
    let offer_name : Bool?
   // let discount_type : Bool?
    let offer : Bool?
    let actual_price : String?
    let offer_price : Bool?
    let stock : Int?
    let is_out_of_stock : Int?
    let out_of_stock_selling : Bool?
    let tag : [String]?
    let rating : Int?
    let total_reviews : Int?
    let image : [RelativeProductsImage]?
   // let variants_list : [String]?
}

struct RelativeProductsImage : Codable {
    let image : String?
    let thumbnail : String?

}



struct Viewed_products : Codable {
    let product_id : Int?
    let product_name : String?
    let category_id : Int?
    let is_rating : Int?
    let category_name : String?
    let subcategory_id : Int?
    let subcategory_name : String?
   // let brand_id : Int?
    let brand_name : String?
    let short_description : String?
   // let long_description : String?
    //let content : String?
    let product_type : String?
    //let min_order_qty : Int?
   // let bulk_order_qty : Int?
   // let offer_name : Bool?
  //  let discount_type : Bool?
   // let offer : Bool?
    let actual_price : String?
   // let offer_price : Bool?
    let stock : Int?
    let is_out_of_stock : Bool?
    let out_of_stock_selling : Bool?
    let tag : [String]?
    let rating : Int?
    let total_reviews : Int?
    let image : [ViewedProductsImage]?
   // let variants_list : [String]?
}

struct ViewedProductsImage : Codable {
    let image : String?
    let thumbnail : String?

}
