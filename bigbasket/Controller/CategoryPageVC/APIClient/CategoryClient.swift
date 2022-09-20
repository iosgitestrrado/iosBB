//
//  CategoryClient.swift
//  bigbasket
//
//  Created by Eppancy on 13/09/22.
//

import Foundation
import SwiftyJSON

struct CategoryClient {
    static func get(_ langId: String, completion: @escaping([CategoryModel]?) -> Void) {
        NetworkingHandler.postAPI(with: CategorySubCatURL, parameter: ["lang_id": langId]) { (json) -> ResponseObjectModel? in
            guard let apiResponse = json as? ResponseObjectModel else { return  nil }
            return apiResponse
        } completion: { result in
            ResponseAPI.getResponseObject(result, showAlert: true) { response in
                var cateData = [CategoryModel]()
                if let data = response?["cat_subcat"].array {
                    data.forEach { object in
                        cateData.append(CategoryModel(object))
                    }
                }
                completion(cateData)
            }
        }
    }
}
