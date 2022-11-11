

import Foundation
struct HomePage_Base : Codable {
    let httpcode : Int?
    let status : String?
    let page : String?
    let message : String?
    let data : HomePageData?
}
// MARK: - Data
struct HomePageData : Codable {
    let homepage_categories : Homepage_categories?
    let main_banner : [Main_banner]?
    let top_offer_banner : [Top_offer_banner]?
    let center_offer_banner : [Center_offer_banner]?
    let bottom_offer_banner : [Bottom_offer_banner]?
    let category : [Category]?
    let second_category : [SecondCategory]?
    let category_products : [CategoryProducts]?
    let first_category : [FirstCategory]?
    let featured_products : [Featured_products]?
    let new_arrivals : [New_arrivals]?
    let trending_products : [Trending_products]?
    let explore_products : [Explore_products]?
    let brands : [Brands]?
    let currency : String?
//    //    let languages : [Languages]?
//    //    let cart : String?
   
    //   // let all_category_icon : All_category_icon?
    // let cat_subcat : [Cat_subcat]?
 //    //    let shocking_sale : [String]?
    // let user_data : User_data?
    
    
    
}

struct Homepage_categories : Codable {
    let first_category : String?
    let second_category : String?
    let category_products : String?
    
}
//MARK: - User Data
struct User_data : Codable {
    let user_id : Int?
    let first_name : String?
    let last_name : String?
    let email : String?
    let phone : String?
    let avatar : String?
    
   
}

//MARK: - Main Baner
struct Main_banner : Codable {
    //let id : Int?
    //let identifier : String?
    //let title : String?
    //let description : String?
   // let alt_text : Bool?
   // let button_label : String?
   // let button_link : String?
    //let media_type : String?
    let media : String?
}
//MARK: - Center Offer Banner
struct Center_offer_banner : Codable {
    let id : Int?
    let identifier : String?
    let title : String?
    let description : String?
    let media_type : String?
    let media : String?
    
   
}
//MARK: -  Bottom Offer Banner
struct Bottom_offer_banner : Codable {
    let id : Int?
    let identifier : String?
    let title : String?
    let description : String?
    let media_type : String?
    let media : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case identifier = "identifier"
        case title = "title"
        case description = "description"
        case media_type = "media_type"
        case media = "media"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        identifier = try values.decodeIfPresent(String.self, forKey: .identifier)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        media_type = try values.decodeIfPresent(String.self, forKey: .media_type)
        media = try values.decodeIfPresent(String.self, forKey: .media)
    }
    
}



//MARK: - Category

struct Category : Codable {
    let id : Int?
    let category_name : String?
    let description : String?
    let no_of_prds : Int?
    let image : String?
   
    
}

//MARK: - TopOfferBanner



struct Top_offer_banner : Codable {
 //   let id : Int?
//    let identifier : String?
//    let title : String?
//    let description : String?
//    let media_type : String?
    let media : String?
    
}

//MARK: - BrandMustTry

struct Brands : Codable {
    let brand_id : Int?
    let brand_name : String?
    let brand_description : String?
    let brand_image : String?
 
}

//MARK: - Trending Products
struct Trending_products : Codable {
    let product_id : Int?
    let product_name : String?
    let category_id : Int?
   // let is_rating : Int?
   // let category_name : String?
    let subcategory_id : Int?
   // let subcategory_name : String?
   // let brand_id : Int?
   // let brand_name : String?
   // let product_type : String?
    //    let min_order_qty : Int?
    //    let bulk_order_qty : Int?
   // let offer_name : Bool?
    //let discount_type : Bool?
   // let offer : Bool?
    let actual_price : String?
  //  let offer_price : Bool?
   // let short_description : String?
    //    let tag : [String]?
    //let rating : Int?
  //  let total_reviews : Int?
    let image : [TrendingProductsImage]?
   // let variants_list : [TrendingProductsVariants_list]?
    
   
}
//MARK: - Variants_list
struct TrendingProductsVariants_list : Codable {
    let pro_id : Int?
//    let combination : String?
//    let stock : Int?
//    let is_out_of_stock : Bool?
//    let out_of_stock_selling : Bool?
//    let min_order_qty : Int?
//    let bulk_order_qty : Int?
//    let image : [VariantsListImage]?
//    let offer_name : Bool?
//    let discount_type : Bool?
//    let offer : Bool?
//    let actual_price : String?
//    let offer_price : Bool?
}


//MARK: - Trending Products Image
struct TrendingProductsImage : Codable {
    let image : String?
    let thumbnail : String?
}
// MARK: - Fruit and Vegs
struct FirstCategory : Codable {
    let id : Int?
    let category_id : Int?
    let subcategory_name : String?
    let subcategory_image : String?
}
// MARK: - New Arrivals
struct New_arrivals : Codable {
    let product_id : Int?
   let product_name : String?
//    let category_id : Int?
//    let is_rating : Int?
//    let category_name : String?
//    let subcategory_id : Int?
//    let subcategory_name : String?
//    //  let brand_id : String?
//    let brand_name : String?
//    let product_type : String?
//    let offer_name : Bool?
//    let discount_type : Bool?
//    let offer : Bool?
      let actual_price : String?
//    let offer_price : Bool?
//    //   let short_description : String?
//    let rating : Int?
//    let total_reviews : Int?
    let image : [NewArrivalsImage]?
   // let variants_list : [NewArrivalsVariants_list]?
   
}

//MARK: - New Arrivals Image
struct NewArrivalsImage : Codable {
    let image : String?
    let thumbnail : String?
    
}

//MARK: - Variants_list
struct NewArrivalsVariants_list : Codable {
    let pro_id : Int?
    let combination : String?
    let stock : Int?
    let is_out_of_stock : Bool?
    let out_of_stock_selling : Bool?
    let min_order_qty : Int?
    let bulk_order_qty : Int?
    let image : [VariantsListImage]?
    let offer_name : Bool?
    let discount_type : Bool?
    let offer : Bool?
    let actual_price : String?
    let offer_price : Bool?
}


//MARK: - Variants List Image
struct VariantsListImage : Codable {
    let image : String?
    let thumbnail : String?
    
}
//MARK: - Grocery
struct SecondCategory : Codable {
    let id : Int?
    let category_id : Int?
    let subcategory_name : String?
    let subcategory_image : String?
}
//MARK: - Featured Products
struct Featured_products : Codable {
    let product_id : Int?
    let product_name : String?
//    let category_id : Int?
//    let is_rating : Int?
//    let category_name : String?
//    let subcategory_id : Int?
//    let subcategory_name : String?
//    //    let brand_id : String?
//    let brand_name : String?
//    let product_type : String?
//    let min_order_qty : String?
//    let bulk_order_qty : String?
//    let offer_name : Bool?
//    let discount_type : Bool?
//    let offer : Bool?
    let actual_price : String?
//    let offer_price : Bool?
//    let short_description : String?
//    let rating : Int?
//    let total_reviews : Int?
    let image : [FeaturedProductsImage]?
  //  let variants_list : [FeaturedProductsVariants_list]?
}

//MARK: - FeaturedProducts Variants_list
struct FeaturedProductsVariants_list : Codable {
    let pro_id : Int?
    let combination : String?
    let stock : Int?
    let is_out_of_stock : Bool?
    let out_of_stock_selling : Bool?
    let min_order_qty : Int?
    let bulk_order_qty : Int?
    let image : [VariantsListImage]?
    let offer_name : Bool?
    let discount_type : Bool?
    let offer : Bool?
    let actual_price : String?
    let offer_price : Bool?
}


//MARK: - Featured Products Image
struct FeaturedProductsImage : Codable {
    let image : String?
    let thumbnail : String?
   
}
//MARK: - Beverage Products
struct CategoryProducts : Codable {
   let product_id : Int?
   let product_name : String?
//    let category_id : Int?
//    let is_rating : Int?tre
//    let category_name : String?
//    let subcategory_id : Int?
//    let subcategory_name : String?
//    //let brand_id : Int?
//    let brand_name : String?
//    let product_type : String?
//    let offer_name : Bool?
//    let discount_type : Bool?
//    let offer : Bool?
    let actual_price : String?
//    let offer_price : Bool?
//    let shock_sale_price : Bool?
//    let short_description : String?
//    let rating : Int?
//    let total_reviews : Int?
    let image : [BeverageProductsImage]?
  //  let variants_list : [BeverageProductsVariants_list]?

    
    
}

//MARK: - BeverageProducts Variants_list
struct BeverageProductsVariants_list : Codable {
    let pro_id : Int?
    let combination : String?
    let stock : Int?
    let is_out_of_stock : Bool?
    let out_of_stock_selling : Bool?
    let min_order_qty : Int?
    let bulk_order_qty : Int?
    let image : [VariantsListImage]?
    let offer_name : Bool?
    let discount_type : Bool?
    let offer : Bool?
    let actual_price : String?
    let offer_price : String?
}

//MARK: - Beverage Products Image
struct BeverageProductsImage : Codable {
    let image : String?
    let thumbnail : String?
    
 
}

struct Explore_products : Codable {
     let product_id : Int?
     let product_name : String?
   // let category_id : Int?
   // let is_rating : Int?
    //let category_name : String?
    //let subcategory_id : Int?
    //let subcategory_name : String?
    //    let brand_id : Int?
   // let brand_name : String?
    //let product_type : String?
    //let offer_name : Bool?
    //let discount_type : Bool?
    //let offer : Bool?
   // let actual_price : String?
    //let offer_price : Bool?
    //let short_description : String?
   // let rating : Int?
   // let total_reviews : Int?
    let image : [ExploreProductsImage]?
   // let variants_list : [ExploreProductsVariants_list]?
    
}

//MARK: - ExploreProducts Variants_list
struct ExploreProductsVariants_list : Codable {
    let pro_id : Int?
//    let combination : String?
//    let stock : Int?
//    let is_out_of_stock : Bool?
//    let out_of_stock_selling : Bool?
//    let min_order_qty : Int?
//    let bulk_order_qty : Int?
//    let image : [VariantsListImage]?
//    let offer_name : Bool?
//    let discount_type : Bool?
//    let offer : Bool?
//    let actual_price : String?
//    let offer_price : Bool?
}

//MARK: - Explore Products Image
struct ExploreProductsImage : Codable {
    let image : String?
    let thumbnail : String?
 
}
