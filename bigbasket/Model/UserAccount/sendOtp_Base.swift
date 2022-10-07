

import Foundation
struct sendOtp_Base : Codable {
	let httpcode : Int?
	let status : String?
	let message : String?
	let data : sendOtpData?
}

struct sendOtpData : Codable {
    let otp : Int?
    let country_code : String?
    let phone_number : String?

}
