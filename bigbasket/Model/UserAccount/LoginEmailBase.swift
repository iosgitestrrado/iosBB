//
//  LoginEmailBase.swift
//  bigbasket
//
//  Created by Deepu S on 21/09/22.
//

import Foundation
struct LoginEmailBase : Codable {
    let httpcode : Int?
    let status : String?
    let message : String?
    let data : LoginEmailData?
}

struct LoginEmailData : Codable {
    let access_token : String?
    let user_details : LoginEmailUser_details?
}
struct LoginEmailUser_details : Codable {
    let user_id : Int?
    let fname : String?
    let lname : String?
    let phone : String?
    let email : String?
}
