
import Foundation

struct ProductListSubcategoryBase : Codable {
    let httpcode : Int?
    let status : String?
    let message : String?
    let data : SubcategoryData?

    
}

//MARK: - Subcategory Data

struct SubcategoryData : Codable {
    let subcategory : [Subcategory]?
}
// MARK: - Subcategory
struct Subcategory : Codable {
    let id : Int?
    let subcategory_name : String?
    let subcategory_image : String?
}
