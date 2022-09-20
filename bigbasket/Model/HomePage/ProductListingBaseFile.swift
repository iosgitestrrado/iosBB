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
    
    enum CodingKeys: String, CodingKey {
        
        case products = "products"
        case total_products = "total_products"
        case currency = "currency"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        products = try values.decodeIfPresent([ProductsData].self, forKey: .products)
        total_products = try values.decodeIfPresent(Int.self, forKey: .total_products)
        currency = try values.decodeIfPresent(String.self, forKey: .currency)
    }
    
}

//MARK: - Product

struct ProductsData : Codable {
    let product_id : Int?
//  let product_name : Bool?
    let category_id : Int?
    let category_name : String?
    let subcategory_id : Int?
    let subcategory_name : String?
    //   let brand_id : String?
    let brand_name : String?
    let product_type : String?
    // let min_order_qty : Int?
    //  let bulk_order_qty : Int?
    let offer_name : Bool?
    let discount_type : Bool?
    let offer : Bool?
    let actual_price : String?
    let offer_price : Bool?
    let stock : Int?
    let is_out_of_stock : Bool?
    let out_of_stock_selling : Bool?
    //  let short_description : Bool?
    //  let tag : [String]?
    let is_rating : Int?
    let rating : Int?
    let total_reviews : Int?
    let image : [ProductsListImage?]
    let variants_list : [ProuctListVariants_list]?
    //  let config_prd : [String]?
    //    let offers : [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case product_id = "product_id"
        //   case product_name = "product_name"
        case category_id = "category_id"
        case category_name = "category_name"
        case subcategory_id = "subcategory_id"
        case subcategory_name = "subcategory_name"
        //       case brand_id = "brand_id"
        case brand_name = "brand_name"
        case product_type = "product_type"
        //    case min_order_qty = "min_order_qty"
        //        case bulk_order_qty = "bulk_order_qty"
        case offer_name = "offer_name"
        case discount_type = "discount_type"
        case offer = "offer"
        case actual_price = "actual_price"
        case offer_price = "offer_price"
        case stock = "stock"
        case is_out_of_stock = "is_out_of_stock"
        case out_of_stock_selling = "out_of_stock_selling"
        //       case short_description = "short_description"
        //       case tag = "tag"
        case is_rating = "is_rating"
        case rating = "rating"
        case total_reviews = "total_reviews"
        case image = "image"
        case variants_list = "variants_list"
        //case config_prd = "config_prd"
        //        case offers = "offers"
    }
    
    
    
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
    let offer_name : Bool?
    let discount_type : Bool?
    let offer : Bool?
    let actual_price : String?
    let offer_price : Bool?
    
    enum CodingKeys: String, CodingKey {
        
        case pro_id = "pro_id"
        case combination = "combination"
        case stock = "stock"
        case is_out_of_stock = "is_out_of_stock"
        case out_of_stock_selling = "out_of_stock_selling"
        case min_order_qty = "min_order_qty"
        case bulk_order_qty = "bulk_order_qty"
        case image = "image"
        case offer_name = "offer_name"
        case discount_type = "discount_type"
        case offer = "offer"
        case actual_price = "actual_price"
        case offer_price = "offer_price"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        pro_id = try values.decodeIfPresent(Int.self, forKey: .pro_id)
        combination = try values.decodeIfPresent(String.self, forKey: .combination)
        stock = try values.decodeIfPresent(Int.self, forKey: .stock)
        is_out_of_stock = try values.decodeIfPresent(Bool.self, forKey: .is_out_of_stock)
        out_of_stock_selling = try values.decodeIfPresent(Bool.self, forKey: .out_of_stock_selling)
        min_order_qty = try values.decodeIfPresent(Int.self, forKey: .min_order_qty)
        bulk_order_qty = try values.decodeIfPresent(Int.self, forKey: .bulk_order_qty)
        image = try values.decodeIfPresent([ProductVariantsListImage].self, forKey: .image)
        offer_name = try values.decodeIfPresent(Bool.self, forKey: .offer_name)
        discount_type = try values.decodeIfPresent(Bool.self, forKey: .discount_type)
        offer = try values.decodeIfPresent(Bool.self, forKey: .offer)
        actual_price = try values.decodeIfPresent(String.self, forKey: .actual_price)
        offer_price = try values.decodeIfPresent(Bool.self, forKey: .offer_price)
    }
    
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
