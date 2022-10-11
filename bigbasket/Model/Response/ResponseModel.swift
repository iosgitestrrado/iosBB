//
//  ResponseModel.swift
//  bigbasket
//
//  Created by Eppancy on 13/09/22.
//

import Foundation
import SwiftyJSON
import UIKit

struct ResponseObjectModel: Codable {
    let httpcode: Int?
    let status: String?
    let page:  String?
    let message: String?
    let data: JSON?
}

struct ResponseObjectStringModel: Decodable {
    let httpcode: String?
    let status: String?
    let page:  String?
    let message: String?
    let data: JSON?
}

struct ResponseArrayModel: Decodable {
    let httpcode: Int?
    let status: String?
    let page:  String?
    let message: String?
    let data: [JSON]?
}

struct ResponseArrayStringModel: Decodable {
    let httpcode: String?
    let status: String?
    let page:  String?
    let message: String?
    let data: [JSON]?
}


enum APIResult<T, U> where U: Error  {
    case success(T)
    case failure(U)
}

enum APIError: Error {
    
    case invalidData
    case jsonDecodingFailure
    case responseUnsuccessful(_ description: String)
    case decodingTaskFailure(_ description: String)
    case requestFailed(_ description: String)
    case jsonConversionFailure(_ description: String)
    case postParametersEncodingFalure(_ description: String)
    case applVersionNotvalid(_ description: String)

    var customDescription: String {
        switch self {
        case .requestFailed(let description): return "Error: \(description)"
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful(let description): return "Error: \(description)"
        case .jsonDecodingFailure: return "Error - JSON decoding Failure"
        case .jsonConversionFailure(let description): return "Error: \(description)"
        case .decodingTaskFailure(let description): return "Error: \(description)"
        case .postParametersEncodingFalure(let description): return "Error: \(description)"
        case .applVersionNotvalid(let description): return "\(description)"
        }
    }
}

struct ResponseAPI {
    static let errorMessage = "Something was so wrong in your request or your handling that the API simply couldn't parse the passed data"
    
    // MARK: check response and parse as per requirement
    static func getResponseArray(_ result: APIResult<ResponseArrayModel?, APIError>, showAlert: Bool = true, showSuccMessage: Bool = false, completion: @escaping ([JSON]?) -> ()) {
        switch result {
        case .success(let aPIResponse):
            if let response = aPIResponse, let status = response.status, status.lowercased() == "success", let responseData = response.data {
                if showSuccMessage, let msg = response.message {
                    Toast.show(msg)
                }
                completion(responseData)
            } else if let response = aPIResponse, let msg = response.message {
                if showAlert {
                    Toast.show(msg)
                }
                completion(nil)
            } else {
                if showAlert {
                    Toast.show(errorMessage)
                }
                completion(nil)
            }
        case .failure(let error):
            if showAlert {
                Toast.show(error.localizedDescription)
            }
            completion(nil)
        }
    }
    
    // MARK: check response and parse as per requirement
    static func getResponseObject(_ result: APIResult<ResponseObjectModel?, APIError>, showAlert: Bool = true, showSuccMessage: Bool = false, completion: @escaping (JSON?) -> ()) {
        switch result {
        case .success(let aPIResponse):
            if let response = aPIResponse, let status = response.status, status.lowercased() == "success", let responseData = response.data {
                if showSuccMessage, let msg = response.message {
                    Toast.show(msg)
                }
                completion(responseData)
            } else if let response = aPIResponse, let msg = response.message {
                if showAlert {
                    Toast.show(msg)
                }
                completion(nil)
            } else {
                if showAlert {
                    Toast.show(errorMessage)
                }
                completion(nil)
            }
        case .failure(let error):
            if showAlert {
                Toast.show(error.localizedDescription)
            }
            completion(nil)
        }
    }
}
