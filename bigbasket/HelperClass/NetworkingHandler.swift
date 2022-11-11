//
//  NetworkingHandler.swift
//  bigbasket
//
//  Created by Deepu S on 22/08/22.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

class NetworkingHandler:NSObject {

   // let inputString = "{\"User\":[{\"userlogin\":[\"\(self.emailAddress.text!)\", \"\(self.password.text!)\"]}]}"
    static let shared = NetworkingHandler()

    
    static func Post(url:String,param:[String:Any],success: @escaping (Data)->Void,failure :@escaping (Error)->Void){
        print("##URL \(url)")
        print("###param \(param)")
    
        
        AF.request(url, method: .post, parameters: param,encoding: JSONEncoding.default,headers: nil).responseJSON { response in
            print("###\(JSON(response.data))")
          
            do{
               
                guard let responseData = response.data else {
                    print("Response : \(response.result)")
                    return
                }
                switch  response.result{
                case .success :
                    success(responseData)
                    break
                case .failure(let error):
                    failure(error)
                }
            }catch{
                print("##\(error)")
            }
        }
    }
    /*
    static func postAPI<T: Decodable>(with url: String, parameter: [String: Any], decode: @escaping (Decodable) -> T?, completion: @escaping (APIResult<T, APIError>) -> Void) {
        NetworkingHandler.fetchData(url, param: parameter, decodingType: T.self) { json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    error != nil ? completion(.failure(.decodingTaskFailure("\(error!)"))) : completion(.failure(.invalidData))
                    return
                }
                guard let value = decode(json) else { completion(.failure(.jsonDecodingFailure)); return }
                completion(.success(value))
            }
        }
    }
    
    /// success respone executed on main thread.
    typealias JSONTaskCompletionHandler = (Decodable?, APIError?) -> Void
    static func fetchData<T: Decodable>(_ url:String, param:[String: Any], decodingType: T.Type, completionHandler completion: @escaping JSONTaskCompletionHandler){
        AF.request(url, method: .post, parameters: param, encoding: JSONEncoding.default, headers: nil).responseDecodable(of: decodingType, completionHandler: { response in
            DispatchQueue.main.async {
                guard let responseData = response.data else {
                    print("Response : \(response.result)")
                    return
                }
                switch  response.result{
                case .success :
                    do {
                        let genericModel = try JSONDecoder().decode(decodingType, from: responseData)
                        completion(genericModel, nil)
                    } catch let err {
                        if decodingType == ResponseObjectModel?.self {
                            do {
                                let genericModel = try JSONDecoder().decode(ResponseObjectStringModel.self, from: responseData)
                                let responseJson = ResponseObjectModel(httpcode: Int(genericModel.httpcode ?? "0"), status: genericModel.status, page: genericModel.page, message: genericModel.message, data: genericModel.data)
                                completion(responseJson, nil)
                            } catch let err {
                                completion(nil, .jsonConversionFailure("\(err.localizedDescription)"))
                            }
                        } else if decodingType == ResponseArrayModel?.self {
                            do {
                                let genericModel = try JSONDecoder().decode(ResponseArrayStringModel.self, from: responseData)
                                let responseJson = ResponseArrayModel(httpcode: Int(genericModel.httpcode ?? "0"), status: genericModel.status, page: genericModel.page, message: genericModel.message, data: genericModel.data)
                                completion(responseJson, nil)
                            } catch let err {
                                completion(nil, .jsonConversionFailure("\(err.localizedDescription)"))
                            }
                        } else {
                            completion(nil, .jsonConversionFailure("\(err.localizedDescription)"))
                        }
                        completion(nil, .jsonConversionFailure("\(err.localizedDescription)"))
                    }
                    break
                case .failure(let error):
                    completion(nil, .jsonConversionFailure("\(error.localizedDescription)"))
                }
            }
        })
    }
    */
    
}

