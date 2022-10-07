//
//  ProductListSubcategory.swift
//  bigbasket
//
//  Created by Deepu S on 20/09/22.
//

import Foundation

struct ProductListSubcategoryBase : Codable {
    let httpcode : Int?
    let status : String?
    let message : String?
    let data : SubcategoryData?

    enum CodingKeys: String, CodingKey {

        case httpcode = "httpcode"
        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        httpcode = try values.decodeIfPresent(Int.self, forKey: .httpcode)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(SubcategoryData.self, forKey: .data)
    }

}

//MARK: - Subcategory Data

struct SubcategoryData : Codable {
    let subcategory : [Subcategory]?

    enum CodingKeys: String, CodingKey {

        case subcategory = "subcategory"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        subcategory = try values.decodeIfPresent([Subcategory].self, forKey: .subcategory)
    }

}
// MARK: - Subcategory
struct Subcategory : Codable {
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
