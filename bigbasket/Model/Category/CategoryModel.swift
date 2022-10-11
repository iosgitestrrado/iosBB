//
//  CategoryModel.swift
//  bigbasket
//
//  Created by Eppancy on 13/09/22.
//

import Foundation
import SwiftyJSON
import Alamofire

struct CategoryModel {
    var Id = Int()
    var Name = String()
    var Is_rating = Int()
    var Image = String()
    var Subcategories = [SubCategoryModel]()
    
    init(_ json: JSON) {
        Id = json["category_id"].intValue
        Name = json["category_name"].stringValue
        Is_rating = json["is_rating"].intValue
        Image = json["category_image"].stringValue
        if let subCat = json["subcategory"].array {
            subCat.forEach { object in
                Subcategories.append(SubCategoryModel(object))
            }
        }
    }
}

struct SubCategoryModel {
    var Id = Int()
    var Name = String()
    var Image = String()
    
    init(_ json: JSON) {
        Id = json["id"].intValue
        Name = json["subcategory_name"].stringValue
        Image = json["subcategory_image"].stringValue
    }
}
