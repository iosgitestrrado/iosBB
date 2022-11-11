//
//  AddFavBaseFile.swift
//  bigbasket
//
//  Created by Deepu S on 08/11/22.
//

import Foundation
struct AddFavBaseFile : Codable {
    let httpcode : String?
    let status : String?
    let message : String?
    let data : FavData?

}

struct FavData : Codable {
    let message : String?
}
