//
//  Register_Base.swift
//  bigbasket
//
//  Created by Deepu S on 24/08/22.
//


import Foundation

struct Register_Base : Codable {
    let httpcode : Int?
    let success : String?
    let status : String?
    let error : [String]?

    enum CodingKeys: String, CodingKey {
        case httpcode = "httpcode"
        case success = "success"
        case status = "status"
        case error = "error"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        httpcode = try values.decodeIfPresent(Int.self, forKey: .httpcode)
        success = try values.decodeIfPresent(String.self, forKey: .success)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        error = try values.decodeIfPresent([String].self, forKey: .error)
    }

}
