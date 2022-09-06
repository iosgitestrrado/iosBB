//
//  UserDefaultClass.swift
//  bigbasket
//
//  Created by Deepu S on 22/08/22.
//

import Foundation

enum KeyValue:String {
    case name = "Name"
    case lastName = "LastName"
    case userLanguage = "UserLanguage"
    case accessToken = "accesstoken"
    case userId = "UserId"
    case isLogin = "IsLogin"
}
struct UserDefaultClass {
    
//    let value : String?
//    let key :String
    
    func setUserDefaultString(value:String,key:KeyValue){
        
        UserDefaults.standard.set(value,forKey:key.rawValue)
        
    }
    func getUserDefaultString(key:KeyValue)->String{
        
        return UserDefaults.standard.string(forKey: key.rawValue ) ?? ""
        
    }
}


