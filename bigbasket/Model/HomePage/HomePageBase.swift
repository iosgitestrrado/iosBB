

import Foundation
struct HomePage_Base : Codable {
    let httpcode : Int?
    let status : String?
    let page : String?
    let message : String?
    let data : HomePageData?
    
    enum CodingKeys: String, CodingKey {
        
        case httpcode = "httpcode"
        case status = "status"
        case page = "page"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        httpcode = try values.decodeIfPresent(Int.self, forKey: .httpcode)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        page = try values.decodeIfPresent(String.self, forKey: .page)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(HomePageData.self, forKey: .data)
    }
    
}
// MARK: - Data
struct HomePageData : Codable {
    let user_data : User_data?
    let main_banner : [Main_banner]?
    let top_offer_banner : [Top_offer_banner]?
    let center_offer_banner : [Center_offer_banner]?
    let bottom_offer_banner : [Bottom_offer_banner]?
    let category : [Category]?
    let grocery_subcat : [Grocery_subcat]?
    //    let all_category_icon : All_category_icon?
    let beverage_products : [Beverage_products]?
    let fruit_and_vegs : [Fruit_and_vegs]?
    let featured_products : [Featured_products]?
    //    let cat_subcat : [Cat_subcat]?
    //    let shocking_sale : [String]?
    let new_arrivals : [New_arrivals]?
    let trending_products : [Trending_products]?
    let explore_products : [Explore_products]?
    let brands : [Brands]?
    //    let languages : [Languages]?
    //    let cart : String?
    //    let currency : String?
    
    enum CodingKeys: String, CodingKey {
        
        case user_data = "user_data"
        case main_banner = "main_banner"
        case top_offer_banner = "top_offer_banner"
        case center_offer_banner = "center_offer_banner"
        case bottom_offer_banner = "bottom_offer_banner"
        case category = "category"
        case grocery_subcat = "grocery_subcat"
        //        case all_category_icon = "all_category_icon"
        case beverage_products = "beverage_products"
        case fruit_and_vegs = "fruit_and_vegs"
        case featured_products = "featured_products"
        //        case cat_subcat = "cat_subcat"
        //        case shocking_sale = "shocking_sale"
        case new_arrivals = "new_arrivals"
        case trending_products = "trending_products"
        case explore_products = "explore_products"
        case brands = "brands"
        //        case languages = "languages"
        //        case cart = "cart"
        //        case currency = "currency"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        user_data = try values.decodeIfPresent(User_data.self, forKey: .user_data)
        main_banner = try values.decodeIfPresent([Main_banner].self, forKey: .main_banner)
        top_offer_banner = try values.decodeIfPresent([Top_offer_banner].self, forKey: .top_offer_banner)
        center_offer_banner = try values.decodeIfPresent([Center_offer_banner].self, forKey: .center_offer_banner)
        bottom_offer_banner = try values.decodeIfPresent([Bottom_offer_banner].self, forKey: .bottom_offer_banner)
        category = try values.decodeIfPresent([Category].self, forKey: .category)
        grocery_subcat = try values.decodeIfPresent([Grocery_subcat].self, forKey: .grocery_subcat)
        //        all_category_icon = try values.decodeIfPresent(All_category_icon.self, forKey: .all_category_icon)
        beverage_products = try values.decodeIfPresent([Beverage_products].self, forKey: .beverage_products)
        fruit_and_vegs = try values.decodeIfPresent([Fruit_and_vegs].self, forKey: .fruit_and_vegs)
        featured_products = try values.decodeIfPresent([Featured_products].self, forKey: .featured_products)
        //        cat_subcat = try values.decodeIfPresent([Cat_subcat].self, forKey: .cat_subcat)
        //        shocking_sale = try values.decodeIfPresent([String].self, forKey: .shocking_sale)
        new_arrivals = try values.decodeIfPresent([New_arrivals].self, forKey: .new_arrivals)
        trending_products = try values.decodeIfPresent([Trending_products].self, forKey: .trending_products)
        explore_products = try values.decodeIfPresent([Explore_products].self, forKey: .explore_products)
        brands = try values.decodeIfPresent([Brands].self, forKey: .brands)
        //        languages = try values.decodeIfPresent([Languages].self, forKey: .languages)
        //        cart = try values.decodeIfPresent(String.self, forKey: .cart)
        //        currency = try values.decodeIfPresent(String.self, forKey: .currency)
    }
    
}
//MARK: - User Data
struct User_data : Codable {
    let user_id : Int?
    let first_name : String?
    let last_name : String?
    let email : String?
    let phone : String?
    let avatar : String?
    
    enum CodingKeys: String, CodingKey {
        
        case user_id = "user_id"
        case first_name = "first_name"
        case last_name = "last_name"
        case email = "email"
        case phone = "phone"
        case avatar = "avatar"
    }
}

//MARK: - Main Baner
struct Main_banner : Codable {
    let id : Int?
    let identifier : String?
    let title : String?
    let description : String?
    let alt_text : Bool?
    let button_label : String?
    let button_link : String?
    let media_type : String?
    let media : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case identifier = "identifier"
        case title = "title"
        case description = "description"
        case alt_text = "alt_text"
        case button_label = "button_label"
        case button_link = "button_link"
        case media_type = "media_type"
        case media = "media"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        identifier = try values.decodeIfPresent(String.self, forKey: .identifier)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        alt_text = try values.decodeIfPresent(Bool.self, forKey: .alt_text)
        button_label = try values.decodeIfPresent(String.self, forKey: .button_label)
        button_link = try values.decodeIfPresent(String.self, forKey: .button_link)
        media_type = try values.decodeIfPresent(String.self, forKey: .media_type)
        media = try values.decodeIfPresent(String.self, forKey: .media)
    }
    
}
//MARK: - Center Offer Banner
struct Center_offer_banner : Codable {
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
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case category_name = "category_name"
        case description = "description"
        case no_of_prds = "no_of_prds"
        case image = "image"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        category_name = try values.decodeIfPresent(String.self, forKey: .category_name)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        no_of_prds = try values.decodeIfPresent(Int.self, forKey: .no_of_prds)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }
    
}

//MARK: - TopOfferBanner

struct Top_offer_banner : Codable {
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

//MARK: - BrandMustTry

struct Brands : Codable {
    let brand_id : Int?
    let brand_name : String?
    let brand_description : String?
    let brand_image : String?
    
    enum CodingKeys: String, CodingKey {
        
        case brand_id = "brand_id"
        case brand_name = "brand_name"
        case brand_description = "brand_description"
        case brand_image = "brand_image"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        brand_id = try values.decodeIfPresent(Int.self, forKey: .brand_id)
        brand_name = try values.decodeIfPresent(String.self, forKey: .brand_name)
        brand_description = try values.decodeIfPresent(String.self, forKey: .brand_description)
        brand_image = try values.decodeIfPresent(String.self, forKey: .brand_image)
    }
    
}

//MARK: - Trending Products
struct Trending_products : Codable {
    let product_id : Int?
    let product_name : String?
    let category_id : Int?
    let is_rating : Int?
    let category_name : String?
    let subcategory_id : Int?
    let subcategory_name : String?
    let brand_id : Int?
    let brand_name : String?
    let product_type : String?
    //    let min_order_qty : Int?
    //    let bulk_order_qty : Int?
    let offer_name : Bool?
    let discount_type : Bool?
    let offer : Bool?
    let actual_price : String?
    let offer_price : Bool?
    let short_description : String?
    //    let tag : [String]?
    let rating : Int?
    let total_reviews : Int?
    let image : [TrendingProductsImage]?
    let variants_list : [Variants_list]?
    
    enum CodingKeys: String, CodingKey {
        
        case product_id = "product_id"
        case product_name = "product_name"
        case category_id = "category_id"
        case is_rating = "is_rating"
        case category_name = "category_name"
        case subcategory_id = "subcategory_id"
        case subcategory_name = "subcategory_name"
        case brand_id = "brand_id"
        case brand_name = "brand_name"
        case product_type = "product_type"
        //        case min_order_qty = "min_order_qty"
        //        case bulk_order_qty = "bulk_order_qty"
        case offer_name = "offer_name"
        case discount_type = "discount_type"
        case offer = "offer"
        case actual_price = "actual_price"
        case offer_price = "offer_price"
        case short_description = "short_description"
        //        case tag = "tag"
        case rating = "rating"
        case total_reviews = "total_reviews"
        case image = "image"
        case variants_list = "variants_list"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
        product_name = try values.decodeIfPresent(String.self, forKey: .product_name)
        category_id = try values.decodeIfPresent(Int.self, forKey: .category_id)
        is_rating = try values.decodeIfPresent(Int.self, forKey: .is_rating)
        category_name = try values.decodeIfPresent(String.self, forKey: .category_name)
        subcategory_id = try values.decodeIfPresent(Int.self, forKey: .subcategory_id)
        subcategory_name = try values.decodeIfPresent(String.self, forKey: .subcategory_name)
        brand_id = try values.decodeIfPresent(Int.self, forKey: .brand_id)
        brand_name = try values.decodeIfPresent(String.self, forKey: .brand_name)
        product_type = try values.decodeIfPresent(String.self, forKey: .product_type)
        //        min_order_qty = try values.decodeIfPresent(Int.self, forKey: .min_order_qty)
        //        bulk_order_qty = try values.decodeIfPresent(Int.self, forKey: .bulk_order_qty)
        offer_name = try values.decodeIfPresent(Bool.self, forKey: .offer_name)
        discount_type = try values.decodeIfPresent(Bool.self, forKey: .discount_type)
        offer = try values.decodeIfPresent(Bool.self, forKey: .offer)
        actual_price = try values.decodeIfPresent(String.self, forKey: .actual_price)
        offer_price = try values.decodeIfPresent(Bool.self, forKey: .offer_price)
        short_description = try values.decodeIfPresent(String.self, forKey: .short_description)
        //        tag = try values.decodeIfPresent([String].self, forKey: .tag)
        rating = try values.decodeIfPresent(Int.self, forKey: .rating)
        total_reviews = try values.decodeIfPresent(Int.self, forKey: .total_reviews)
        image = try values.decodeIfPresent([TrendingProductsImage].self, forKey: .image)
        variants_list = try values.decodeIfPresent([Variants_list].self, forKey: .variants_list)
    }
    
}

//MARK: - Trending Products Image
struct TrendingProductsImage : Codable {
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
// MARK: - Fruit and Vegs
struct Fruit_and_vegs : Codable {
    let id : Int?
    let subcategory_name : String?
    let subcategory_image : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case subcategory_name = "subcategory_name"
        case subcategory_image = "subcategory_image"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        subcategory_name = try values.decodeIfPresent(String.self, forKey: .subcategory_name)
        subcategory_image = try values.decodeIfPresent(String.self, forKey: .subcategory_image)
    }
    
}
// MARK: - New Arrivals
struct New_arrivals : Codable {
    let product_id : Int?
    //   let product_name : String?
    let category_id : Int?
    let is_rating : Int?
    let category_name : String?
    let subcategory_id : Int?
    let subcategory_name : String?
    //  let brand_id : String?
    let brand_name : String?
    let product_type : String?
    let offer_name : Bool?
    let discount_type : Bool?
    let offer : Bool?
    let actual_price : String?
    let offer_price : Bool?
    //   let short_description : String?
    let rating : Int?
    let total_reviews : Int?
    let image : [NewArrivalsImage]?
    let variants_list : [Variants_list]?
    
    enum CodingKeys: String, CodingKey {
        
        case product_id = "product_id"
        //      case product_name = "product_name"
        case category_id = "category_id"
        case is_rating = "is_rating"
        case category_name = "category_name"
        case subcategory_id = "subcategory_id"
        case subcategory_name = "subcategory_name"
        //      case brand_id = "brand_id"
        case brand_name = "brand_name"
        case product_type = "product_type"
        case offer_name = "offer_name"
        case discount_type = "discount_type"
        case offer = "offer"
        case actual_price = "actual_price"
        case offer_price = "offer_price"
        //      case short_description = "short_description"
        case rating = "rating"
        case total_reviews = "total_reviews"
        case image = "image"
        case variants_list = "variants_list"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
        //       product_name = try values.decodeIfPresent(String.self, forKey: .product_name)
        category_id = try values.decodeIfPresent(Int.self, forKey: .category_id)
        is_rating = try values.decodeIfPresent(Int.self, forKey: .is_rating)
        category_name = try values.decodeIfPresent(String.self, forKey: .category_name)
        subcategory_id = try values.decodeIfPresent(Int.self, forKey: .subcategory_id)
        subcategory_name = try values.decodeIfPresent(String.self, forKey: .subcategory_name)
        //     brand_id = try values.decodeIfPresent(String.self, forKey: .brand_id)
        brand_name = try values.decodeIfPresent(String.self, forKey: .brand_name)
        product_type = try values.decodeIfPresent(String.self, forKey: .product_type)
        offer_name = try values.decodeIfPresent(Bool.self, forKey: .offer_name)
        discount_type = try values.decodeIfPresent(Bool.self, forKey: .discount_type)
        offer = try values.decodeIfPresent(Bool.self, forKey: .offer)
        actual_price = try values.decodeIfPresent(String.self, forKey: .actual_price)
        offer_price = try values.decodeIfPresent(Bool.self, forKey: .offer_price)
        //    short_description = try values.decodeIfPresent(String.self, forKey: .short_description)
        rating = try values.decodeIfPresent(Int.self, forKey: .rating)
        total_reviews = try values.decodeIfPresent(Int.self, forKey: .total_reviews)
        image = try values.decodeIfPresent([NewArrivalsImage].self, forKey: .image)
        variants_list = try values.decodeIfPresent([Variants_list].self, forKey: .variants_list)
    }
    
}

//MARK: - New Arrivals Image
struct NewArrivalsImage : Codable {
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

//MARK: - Variants_list
struct Variants_list : Codable {
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
        image = try values.decodeIfPresent([VariantsListImage].self, forKey: .image)
        offer_name = try values.decodeIfPresent(Bool.self, forKey: .offer_name)
        discount_type = try values.decodeIfPresent(Bool.self, forKey: .discount_type)
        offer = try values.decodeIfPresent(Bool.self, forKey: .offer)
        actual_price = try values.decodeIfPresent(String.self, forKey: .actual_price)
        offer_price = try values.decodeIfPresent(Bool.self, forKey: .offer_price)
    }
    
}


//MARK: - Variants List Image
struct VariantsListImage : Codable {
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
//MARK: - Grocery
struct Grocery_subcat : Codable {
    let id : Int?
    let subcategory_name : String?
    let subcategory_image : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case subcategory_name = "subcategory_name"
        case subcategory_image = "subcategory_image"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        subcategory_name = try values.decodeIfPresent(String.self, forKey: .subcategory_name)
        subcategory_image = try values.decodeIfPresent(String.self, forKey: .subcategory_image)
    }
    
}
//MARK: - Featured Products
struct Featured_products : Codable {
    let product_id : Int?
    let product_name : String?
    let category_id : Int?
    let is_rating : Int?
    let category_name : String?
    let subcategory_id : Int?
    let subcategory_name : String?
    //    let brand_id : String?
    let brand_name : String?
    let product_type : String?
    let min_order_qty : String?
    let bulk_order_qty : String?
    let offer_name : Bool?
    let discount_type : Bool?
    let offer : Bool?
    let actual_price : String?
    let offer_price : Bool?
    let short_description : String?
    let rating : Int?
    let total_reviews : Int?
    let image : [FeaturedProductsImage]?
    let variants_list : [Variants_list]?
    
    enum CodingKeys: String, CodingKey {
        
        case product_id = "product_id"
        case product_name = "product_name"
        case category_id = "category_id"
        case is_rating = "is_rating"
        case category_name = "category_name"
        case subcategory_id = "subcategory_id"
        case subcategory_name = "subcategory_name"
        //        case brand_id = "brand_id"
        case brand_name = "brand_name"
        case product_type = "product_type"
        case min_order_qty = "min_order_qty"
        case bulk_order_qty = "bulk_order_qty"
        case offer_name = "offer_name"
        case discount_type = "discount_type"
        case offer = "offer"
        case actual_price = "actual_price"
        case offer_price = "offer_price"
        case short_description = "short_description"
        case rating = "rating"
        case total_reviews = "total_reviews"
        case image = "image"
        case variants_list = "variants_list"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
        product_name = try values.decodeIfPresent(String.self, forKey: .product_name)
        category_id = try values.decodeIfPresent(Int.self, forKey: .category_id)
        is_rating = try values.decodeIfPresent(Int.self, forKey: .is_rating)
        category_name = try values.decodeIfPresent(String.self, forKey: .category_name)
        subcategory_id = try values.decodeIfPresent(Int.self, forKey: .subcategory_id)
        subcategory_name = try values.decodeIfPresent(String.self, forKey: .subcategory_name)
        //        brand_id = try values.decodeIfPresent(String.self, forKey: .brand_id)
        brand_name = try values.decodeIfPresent(String.self, forKey: .brand_name)
        product_type = try values.decodeIfPresent(String.self, forKey: .product_type)
        min_order_qty = try values.decodeIfPresent(String.self, forKey: .min_order_qty)
        bulk_order_qty = try values.decodeIfPresent(String.self, forKey: .bulk_order_qty)
        offer_name = try values.decodeIfPresent(Bool.self, forKey: .offer_name)
        discount_type = try values.decodeIfPresent(Bool.self, forKey: .discount_type)
        offer = try values.decodeIfPresent(Bool.self, forKey: .offer)
        actual_price = try values.decodeIfPresent(String.self, forKey: .actual_price)
        offer_price = try values.decodeIfPresent(Bool.self, forKey: .offer_price)
        short_description = try values.decodeIfPresent(String.self, forKey: .short_description)
        rating = try values.decodeIfPresent(Int.self, forKey: .rating)
        total_reviews = try values.decodeIfPresent(Int.self, forKey: .total_reviews)
        image = try values.decodeIfPresent([FeaturedProductsImage].self, forKey: .image)
        variants_list = try values.decodeIfPresent([Variants_list].self, forKey: .variants_list)
    }
    
}

//MARK: - Featured Products Image
struct FeaturedProductsImage : Codable {
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
//MARK: - Beverage Products
struct Beverage_products : Codable {
    let product_id : Int?
    let product_name : String?
    let category_id : Int?
    let is_rating : Int?
    let category_name : String?
    let subcategory_id : Int?
    let subcategory_name : String?
    let brand_id : Int?
    let brand_name : String?
    let product_type : String?
    let offer_name : Bool?
    let discount_type : Bool?
    let offer : Bool?
    let actual_price : String?
    let offer_price : Bool?
    let shock_sale_price : Bool?
    let short_description : String?
    let rating : Int?
    let total_reviews : Int?
    let image : [BeverageProductsImage]?
    let variants_list : [Variants_list]?
    
    enum CodingKeys: String, CodingKey {
        
        case product_id = "product_id"
        case product_name = "product_name"
        case category_id = "category_id"
        case is_rating = "is_rating"
        case category_name = "category_name"
        case subcategory_id = "subcategory_id"
        case subcategory_name = "subcategory_name"
        case brand_id = "brand_id"
        case brand_name = "brand_name"
        case product_type = "product_type"
        case offer_name = "offer_name"
        case discount_type = "discount_type"
        case offer = "offer"
        case actual_price = "actual_price"
        case offer_price = "offer_price"
        case shock_sale_price = "shock_sale_price"
        case short_description = "short_description"
        case rating = "rating"
        case total_reviews = "total_reviews"
        case image = "image"
        case variants_list = "variants_list"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
        product_name = try values.decodeIfPresent(String.self, forKey: .product_name)
        category_id = try values.decodeIfPresent(Int.self, forKey: .category_id)
        is_rating = try values.decodeIfPresent(Int.self, forKey: .is_rating)
        category_name = try values.decodeIfPresent(String.self, forKey: .category_name)
        subcategory_id = try values.decodeIfPresent(Int.self, forKey: .subcategory_id)
        subcategory_name = try values.decodeIfPresent(String.self, forKey: .subcategory_name)
        brand_id = try values.decodeIfPresent(Int.self, forKey: .brand_id)
        brand_name = try values.decodeIfPresent(String.self, forKey: .brand_name)
        product_type = try values.decodeIfPresent(String.self, forKey: .product_type)
        offer_name = try values.decodeIfPresent(Bool.self, forKey: .offer_name)
        discount_type = try values.decodeIfPresent(Bool.self, forKey: .discount_type)
        offer = try values.decodeIfPresent(Bool.self, forKey: .offer)
        actual_price = try values.decodeIfPresent(String.self, forKey: .actual_price)
        offer_price = try values.decodeIfPresent(Bool.self, forKey: .offer_price)
        shock_sale_price = try values.decodeIfPresent(Bool.self, forKey: .shock_sale_price)
        short_description = try values.decodeIfPresent(String.self, forKey: .short_description)
        rating = try values.decodeIfPresent(Int.self, forKey: .rating)
        total_reviews = try values.decodeIfPresent(Int.self, forKey: .total_reviews)
        image = try values.decodeIfPresent([BeverageProductsImage].self, forKey: .image)
        variants_list = try values.decodeIfPresent([Variants_list].self, forKey: .variants_list)
    }
    
}

//MARK: - Beverage Products Image
struct BeverageProductsImage : Codable {
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

struct Explore_products : Codable {
    let product_id : Int?
    //  let product_name : String?
    let category_id : Int?
    let is_rating : Int?
    let category_name : String?
    let subcategory_id : Int?
    let subcategory_name : String?
    //    let brand_id : Int?
    let brand_name : String?
    let product_type : String?
    let offer_name : Bool?
    let discount_type : Bool?
    let offer : Bool?
    let actual_price : String?
    let offer_price : Bool?
    let short_description : String?
    let rating : Int?
    let total_reviews : Int?
    let image : [ExploreProductsImage]?
    let variants_list : [Variants_list]?
    
    enum CodingKeys: String, CodingKey {
        
        case product_id = "product_id"
        //  case product_name = "product_name"
        case category_id = "category_id"
        case is_rating = "is_rating"
        case category_name = "category_name"
        case subcategory_id = "subcategory_id"
        case subcategory_name = "subcategory_name"
        //       case brand_id = "brand_id"
        case brand_name = "brand_name"
        case product_type = "product_type"
        case offer_name = "offer_name"
        case discount_type = "discount_type"
        case offer = "offer"
        case actual_price = "actual_price"
        case offer_price = "offer_price"
        case short_description = "short_description"
        case rating = "rating"
        case total_reviews = "total_reviews"
        case image = "image"
        case variants_list = "variants_list"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
        //   product_name = try values.decodeIfPresent(String.self, forKey: .product_name)
        category_id = try values.decodeIfPresent(Int.self, forKey: .category_id)
        is_rating = try values.decodeIfPresent(Int.self, forKey: .is_rating)
        category_name = try values.decodeIfPresent(String.self, forKey: .category_name)
        subcategory_id = try values.decodeIfPresent(Int.self, forKey: .subcategory_id)
        subcategory_name = try values.decodeIfPresent(String.self, forKey: .subcategory_name)
        //       brand_id = try values.decodeIfPresent(Int.self, forKey: .brand_id)
        brand_name = try values.decodeIfPresent(String.self, forKey: .brand_name)
        product_type = try values.decodeIfPresent(String.self, forKey: .product_type)
        offer_name = try values.decodeIfPresent(Bool.self, forKey: .offer_name)
        discount_type = try values.decodeIfPresent(Bool.self, forKey: .discount_type)
        offer = try values.decodeIfPresent(Bool.self, forKey: .offer)
        actual_price = try values.decodeIfPresent(String.self, forKey: .actual_price)
        offer_price = try values.decodeIfPresent(Bool.self, forKey: .offer_price)
        short_description = try values.decodeIfPresent(String.self, forKey: .short_description)
        rating = try values.decodeIfPresent(Int.self, forKey: .rating)
        total_reviews = try values.decodeIfPresent(Int.self, forKey: .total_reviews)
        image = try values.decodeIfPresent([ExploreProductsImage].self, forKey: .image)
        variants_list = try values.decodeIfPresent([Variants_list].self, forKey: .variants_list)
    }
    
}
//MARK: - Explore Products Image
struct ExploreProductsImage : Codable {
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
