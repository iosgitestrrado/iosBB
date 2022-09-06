//
//  LoginVerifyOtp.swift
//  bigbasket
//
//  Created by Deepu S on 02/09/22.
//


import Foundation
struct LoginVerifyOtp_Base : Codable {
    let httpcode : Int?
    let status : String?
    let message : String?
    let data : LoginVerifyOtpData?
    
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
        data = try values.decodeIfPresent(LoginVerifyOtpData.self, forKey: .data)
    }
    
}
struct LoginVerifyOtpData : Codable {
    let access_token : String?
    let user_details : User_details?
    
    enum CodingKeys: String, CodingKey {
        
        case access_token = "access_token"
        case user_details = "user_details"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        access_token = try values.decodeIfPresent(String.self, forKey: .access_token)
        user_details = try values.decodeIfPresent(User_details.self, forKey: .user_details)
    }
    
}
struct User_details : Codable {
    let user_id : Int?
    let fname : String?
    let lname : String?
    let phone : String?
    let email : String?
    
    enum CodingKeys: String, CodingKey {
        
        case user_id = "user_id"
        case fname = "fname"
        case lname = "lname"
        case phone = "phone"
        case email = "email"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
        fname = try values.decodeIfPresent(String.self, forKey: .fname)
        lname = try values.decodeIfPresent(String.self, forKey: .lname)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        email = try values.decodeIfPresent(String.self, forKey: .email)
    }
    
}
