//
//  LoginByEmailViewController.swift
//  bigbasket
//
//  Created by Deepu S on 21/09/22.
//

import UIKit
import Toast_Swift

class LoginByEmailViewController: UIViewController {
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var BackView: UIView!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    
    let  userDefaults = UserDefaultClass();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnLogin.btnCorner()
        BackView.viewRoundCorners(with: .top,radius: 14)
        
    }
    
    @IBAction func ClickSendOtp(_ sender: Any) {
        
        let loginByEmailMasterClass = LoginByEmailMasterClass(EmailId: EmailTextField.text!, Password: PasswordField.text!)
        
        do {
            self.StartSpiner()
            if try loginByEmailMasterClass.loginCredentialsVerification(){
                
                loginByEmailMasterClass.loginEmailEndPoint { mData in
                    do{
                        let jsonDecoder = JSONDecoder()
                        let responseModel = try jsonDecoder.decode(LoginEmailBase.self, from: mData)
                        print("# Response \(String(data: mData, encoding: .utf8) ?? "No Data")")
                        if responseModel.httpcode == 200 {
                            self.userDefaults.setUserDefaultString(value: responseModel.data?.access_token ?? "", key: .accessToken)
                            self.userDefaults.setUserDefaultString(value:"\(responseModel.data?.user_details?.user_id ?? 0)" , key: .userId)
                            
                            self.userDefaults.setUserDefaultString(value: "true", key: .isLogin)
                            
                            self.goToHomePage()
                        }
                        else{
                            self.StopSpiner()
                            self.view.makeToast(responseModel.message)
                        }
                    }catch(let Error){
                        print("#Error \(Error.localizedDescription)")
                    }
                }
            }else{}
            
        }catch(let Error){
            print("#Error \(Error.localizedDescription)")
            let error = Error as! ErrorMsg
            self.view.makeToast("\(error.rawValue)")
            self.StopSpiner()
            
        }
        
    }
    
    @IBAction func clickLoginSms(_ sender: Any) {
        goToLoginSMS()
    }
    
    @IBAction func clickForgotPassword(_ sender: Any) {
    }
    //MARK:- Func
    func goToHomePage (){
        let storyBoard : UIStoryboard = UIStoryboard(name: "HomeMain", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CustomeTabBarController") as! CustomeTabBarController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    func goToForgotPassword (){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    func goToLoginSMS (){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! LoginPageViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    func goToSingUp (){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
