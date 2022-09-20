//
//  ProfileModel.swift
//  bigbasket
//
//  Created by Eppancy on 15/09/22.
//

import Foundation
import SwiftyJSON

struct ProfileModel {
    var User_id = Int()
    var Username = String()
    var First_name = String()
    var Last_name = String()
    var Country_code = String()
    var Phone = String()
    var Email = String()
//    var Address1 = String()
//    var Country = String()
//    var State = String()
//    var City = String()
//    var Country_id = Int()
//    var State_id = Int()
//    var City_id = Int()
//    var Birthday = String()
//    var Gender = String()
    var Profile_image = String()
    var Joined_date = String()
    var Invite_save = String()
    var Invite_count = Int()
    var Wallet = Int()
    var Credits = Int()
    var Loyalty_points = Int()
    var optionCellData = [ProfileOptionCellData]()

    init() { }
    init(_ json: JSON) {
        User_id = json["user_id"].intValue
        Username = json["username"].stringValue
        First_name = json["first_name"].stringValue
        Last_name = json["last_name"].stringValue
        Country_code = json["country_code"].stringValue
        Phone = json["phone"].stringValue
        Email = json["email"].stringValue
//        Address1 = json["address1"].stringValue
//        Country = json["country"].stringValue
//        State = json["state"].stringValue
//        City = json["city"].stringValue
//        Country_id = json["country_id"].intValue
//        State_id = json["state_id"].intValue
//        City_id = json["city_id"].intValue
//        Birthday = json["birthday"].stringValue
//        Gender = json["gender"].stringValue
        Profile_image = json["profile_image"].stringValue
        Joined_date = json["joined_date"].stringValue
        Invite_save = json["invite_save"].stringValue
        Invite_count = json["invite_count"].intValue
        Wallet = json["wallet"].intValue
        Credits = json["credits"].intValue
        Loyalty_points = json["loyalty_points"].intValue
    }
}

struct ProfileOptionCellData {
    var title = String()
    var currency = String()
    var value = String()
}

struct ProfileListCellData {
    var title = String()
    var image = String()
}
