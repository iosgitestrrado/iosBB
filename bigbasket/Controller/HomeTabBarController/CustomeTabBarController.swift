//
//  CustomeTabBarController.swift
//  bigbasket
//
//  Created by Deepu S on 29/08/22.
//

import UIKit

class CustomeTabBarController: UITabBarController {
   //MARK: -  Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
