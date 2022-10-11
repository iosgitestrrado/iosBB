//
//  Core.swift
//  TaleOMeter
//
//  Created by Durgesh on 15/02/22.
//  Copyright © 2022 Durgesh. All rights reserved.
//

import Foundation
import NVActivityIndicatorView
import UIKit

class Core: NSObject {
    static var activityIndicator: NVActivityIndicatorView = NVActivityIndicatorView(frame: CGRect.zero)
    
    static func ShowProgress(_ target: UIViewController, detailLbl: String) {
        if let indc = target.view.viewWithTag(9566) {
            indc.removeFromSuperview()
        }
        activityIndicator.removeFromSuperview()
        let xAxis = (target.view.frame.size.width / 2.0)
        let yAxis = (target.view.frame.size.height / 2.0)

        let frame = CGRect(x: (xAxis - 50.0), y: (yAxis - 50.0), width: 100.0, height: 100.0)
        activityIndicator = NVActivityIndicatorView(frame: frame)
        activityIndicator.type = .ballRotateChase // add your type
        activityIndicator.color = UIColor.primarycolor() // add your color
        activityIndicator.tag = 9566
        //        NVActivityIndicatorPresenter.sharedInstance.setMessage("Fetching Data...")
        target.view.addSubview(activityIndicator)
        target.view.isUserInteractionEnabled = false
        activityIndicator.startAnimating()
    }

    static func HideProgress(_ target: UIViewController) {
        DispatchQueue.main.async {
            target.view.isUserInteractionEnabled = true
            if let indc = target.view.viewWithTag(9566) {
                indc.removeFromSuperview()
            }
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
}
