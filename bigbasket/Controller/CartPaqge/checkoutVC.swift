//
//  checkoutVC.swift
//  bigbasket
//
//  Created by Deepu S on 29/09/22.
//

import UIKit

class checkoutVC: UIViewController {

    @IBOutlet weak var PlaceOrderButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        PlaceOrderButton.setTitle("", for: .normal)
    }
     
}
