//
//  Message.swift
//  bigbasket
//
//  Created by Deepu S on 22/08/22.
//


import Foundation

enum ErrorMsg: String, Error {
case invalidPhoneNumber = "Invalid phone number"
case invalidOtp = "Invalid OTP"
case invalidEmailAddress = "Invalid email address"
case invalidPassword = "Invalid password"
case passworNotMatch = "Your password and confirmation password do not match."
    
}
