//
//  AddressBase.swift
//  bigbasket
//
//  Created by Deepu S on 19/10/22.
//

import Foundation
struct AddressBase : Codable {
    let httpcode : String?
    let status : String?
    let message : String?
    let data : AddressData?


}
struct AddressData : Codable {
    let address_list : [Address_list]?

}

struct Address_list : Codable {
    let id : Int?
    let name : String?
    let address_type : String?
//    let address_type_id : Int?
//    let country_code : String?
//    let phone : Int?
//    let country : String?
//    let state : String?
//    let city : String?
//    let country_id : Int?
//    let state_id : Int?
//    let city_id : Int?
//    let address1 : String?
      let address2 : String?
//    let pincode : String?
//    let street : String?
//    let house : String?
//    let neighborhood : String?
//    let latitude : String?
//    let longitude : String?
//    let is_default : Int?

    

}
