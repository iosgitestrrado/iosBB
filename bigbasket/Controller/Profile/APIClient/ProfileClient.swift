//
//  ProfileClient.swift
//  bigbasket
//
//  Created by Eppancy on 15/09/22.
//

import Foundation
import SwiftyJSON

struct ProfileClient {
    static let userDefaultClass = UserDefaultClass()
    static func get(_ completion: @escaping(ProfileModel?) -> Void) {
        NetworkingHandler.postAPI(with: ProfileURL, parameter: ["access_token": ProfileClient.userDefaultClass.getUserDefaultString(key: .accessToken)]) { (json) -> ResponseObjectModel? in
            guard let apiResponse = json as? ResponseObjectModel else { return  nil }
            return apiResponse
        } completion: { result in
            ResponseAPI.getResponseObject(result, showAlert: true) { response in
                var profileData: ProfileModel?
                if let data = response?["profile"].array, data.count > 0 {
                    profileData = ProfileModel(data[0])
                }
                completion(profileData)
            }
        }
    }
}
