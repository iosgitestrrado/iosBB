

import Foundation
struct sendOtp_Base : Codable {
	let httpcode : Int?
	let status : String?
	let message : String?
	let data : sendOtpData?

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
		data = try values.decodeIfPresent(sendOtpData.self, forKey: .data)
	}

}

struct sendOtpData : Codable {
    let otp : Int?
    let country_code : String?
    let phone_number : String?

    enum CodingKeys: String, CodingKey {

        case otp = "otp"
        case country_code = "country_code"
        case phone_number = "phone_number"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        otp = try values.decodeIfPresent(Int.self, forKey: .otp)
        country_code = try values.decodeIfPresent(String.self, forKey: .country_code)
        phone_number = try values.decodeIfPresent(String.self, forKey: .phone_number)
    }

}
