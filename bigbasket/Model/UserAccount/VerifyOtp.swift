//
//  VerifyOtp.swift
//  bigbasket
//
//  Created by Deepu S on 25/08/22.
//

import Foundation

// MARK: - Register OTP Verify
struct RegisterVerifyOtp_Base : Codable {
    let httpcode : Int?
    let status : String?
    let message : String?
    let data : RegisterVerifyOtpData?

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
        data = try values.decodeIfPresent(RegisterVerifyOtpData.self, forKey: .data)
    }

}

struct RegisterVerifyOtpData : Codable {
    let redirect : String?
    let country_code : String?
    let phone_number : String?

    enum CodingKeys: String, CodingKey {

        case redirect = "redirect"
        case country_code = "country_code"
        case phone_number = "phone_number"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        redirect = try values.decodeIfPresent(String.self, forKey: .redirect)
        country_code = try values.decodeIfPresent(String.self, forKey: .country_code)
        phone_number = try values.decodeIfPresent(String.self, forKey: .phone_number)
    }

}

//MARK: - Login Otp OTP Verify
