//
//  LaunchScreenVC.swift
//  bigbasket
//
//  Created by Deepu S on 05/09/22.
//

import UIKit

class LaunchScreenVC: UIViewController {
    let userDefaultClass = UserDefaultClass()
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            
            if self.userDefaultClass.getUserDefaultString(key: .isLogin) == "true" {
                self.goToHomePageVc()
            }else{
                self.goToLoginVc()
            }
           
        })
    }
    
    //MARK: - NavigationController
    
    func goToHomePageVc (){
        let storyBoard : UIStoryboard = UIStoryboard(name: "HomeMain", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CustomeTabBarController") as! CustomeTabBarController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    func goToLoginVc (){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}
