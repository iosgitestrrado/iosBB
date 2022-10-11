//
//  Toast.swift
//  TaleOMeter
//
//  Created by Durgesh on 15/03/22.
//

import UIKit
import Toast_Swift

class Toast: NSObject {
    static func show(_ message: String = "Please check your internet connection and try again.!!") {
        DispatchQueue.main.async {
            // Get current window
            guard let superview = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
            superview.makeToast(message)
        }
    }
}
