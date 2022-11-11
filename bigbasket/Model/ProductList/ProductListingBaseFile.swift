//
//  ProductListingBaseFile.swift
//  bigbasket
//
//  Created by Deepu S on 19/09/22.
//

import Foundation
struct ProductListingBase : Codable {
    let httpcode : Int?
    let status : String?
    let page : String?
    let data : ProductListData?
    
    enum CodingKeys: String, CodingKey {
        
        case httpcode = "httpcode"
        case status = "status"
        case page = "page"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        httpcode = try values.decodeIfPresent(Int.self, forKey: .httpcode)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        page = try values.decodeIfPresent(String.self, forKey: .page)
        data = try values.decodeIfPresent(ProductListData.self, forKey: .data)
    }
    
}


//MARK: - Data

struct ProductListData : Codable {
    let products : [ProductsData]?
    let total_products : Int?
    let currency : String?
    
}

//MARK: - Product

struct ProductsData : Codable {
    let product_id : Int?
    let product_name : String?
    let category_id : Int?
    let category_name : String?
    let subcategory_id : Int?
    var subcategory_name : String?
    //   let brand_id : String?
    let brand_name : String?
    let product_type : String?
    let min_order_qty : Int?
    let bulk_order_qty : Int?
    //let offer_name : Bool?
  //  let discount_type : Bool?
    let offer : String?
    let actual_price : String?
    let offer_price : String?
    //let stock : Int?
    let is_out_of_stock : Bool?
   // let out_of_stock_selling : Bool?
    //  let short_description : Bool?
    //  let tag : [String]?
    let is_rating : Int?
    let rating : Int?
    let total_reviews : Int?
    let image : [ProductsListImage?]
    let variants_list : [ProuctListVariants_list]?
    //  let config_prd : [String]?
    //    let offers : [String]?

}

//MARK: - Explore Products Image
struct ProductsListImage : Codable {
    let image : String?
    let thumbnail : String?
    
    enum CodingKeys: String, CodingKey {
        
        case image = "image"
        case thumbnail = "thumbnail"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
    }
    
}

struct ProuctListVariants_list : Codable {
    let pro_id : Int?
    let combination : String?
    let stock : Int?
    let is_out_of_stock : Bool?
    let out_of_stock_selling : Bool?
    let min_order_qty : Int?
    let bulk_order_qty : Int?
    let image : [ProductVariantsListImage]?
   // let offer_name : Bool?
  //  let discount_type : Bool?
   // let offer : Bool?
    let actual_price : String?
   // let offer_price : Bool?
}


//MARK: - Variants List Image
struct ProductVariantsListImage : Codable {
    let image : String?
    let thumbnail : String?
    
    enum CodingKeys: String, CodingKey {
        
        case image = "image"
        case thumbnail = "thumbnail"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
    }
}
