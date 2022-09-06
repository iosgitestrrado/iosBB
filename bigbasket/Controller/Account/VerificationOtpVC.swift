//
//  VerificationOtpVC.swift
//  bigbasket
//
//  Created by Deepu S on 25/08/22.
//

import UIKit
import SwiftyJSON

class VerificationOtpVC: UIViewController {
    
    @IBOutlet weak var resendOtp: UIButton!
    @IBOutlet weak var btnSendOtp: UIButton!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var otpTextField5: UITextField!
    @IBOutlet weak var otpTextField4: UITextField!
    @IBOutlet weak var otpTextField3: UITextField!
    @IBOutlet weak var otpTextField2: UITextField!
    @IBOutlet weak var otpTextField1: UITextField!
    var countryCode = ""
    var phonenumber = ""
    var isLoginPage = false
    override func viewDidLoad() {
        super.viewDidLoad()
        backView.viewRoundCorners(with: .top)
        btnSendOtp.btnCorner()
        
        
        otpTextField1.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otpTextField2.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otpTextField3.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otpTextField4.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otpTextField5.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    
    @objc func textFieldDidChange(textField: UITextField){
        let text = textField.text
        if  text?.count == 1 {
            switch textField{
            case otpTextField1:
                otpTextField2.becomeFirstResponder()
            case otpTextField2:
                otpTextField3.becomeFirstResponder()
            case otpTextField3:
                otpTextField4.becomeFirstResponder()
            case otpTextField4:
                otpTextField4.resignFirstResponder()
            default:
                break
            }
        }
        if  text?.count == 0 {
            switch textField{
            case otpTextField1:
                otpTextField1.becomeFirstResponder()
            case otpTextField2:
                otpTextField1.becomeFirstResponder()
            case otpTextField3:
                otpTextField2.becomeFirstResponder()
            case otpTextField4:
                otpTextField3.becomeFirstResponder()
            default:
                break
            }
        }
        else{
            
        }
    }
    
    //MARK: - Action
    
    
    @IBAction func clickSendOtp(_ sender: Any) {
        
        let otpVerificationMasterClass = OtpVerificationMasterClass(countryCode:self.countryCode.replacingOccurrences(of: "+", with: ""), phoneNumber: self.phonenumber, Otp1: otpTextField1.text!, Otp2: otpTextField2.text!, Otp3: otpTextField3.text!, Otp4: otpTextField4.text!, Otp5: otpTextField5.text!)
        do {
            if(
                try otpVerificationMasterClass.isOtpVerification()){
                if isLoginPage {
                    otpVerificationMasterClass.LoginOtpVerificationEndPoint { mData in
                        do{
                            print("#LoginOtp Response \(JSON(mData))")
                            let jsonDecoder = JSONDecoder()
                            let responseModel = try   jsonDecoder.decode(LoginVerifyOtp_Base.self, from: mData)
                            if (responseModel.httpcode == 200)  {
                                print("#AccessToken\(String(describing: responseModel.data?.access_token))")
                                let userDefaultClass = UserDefaultClass()
                                userDefaultClass.setUserDefaultString(value: responseModel.data?.access_token ?? "", key: .accessToken)
                                self.goToHomePage()    }else{
                                    self.view.makeToast("\(responseModel.message ?? "")")
                                } }catch{
                                }}
                }else{
                   
                    
                    otpVerificationMasterClass.RegisterOtpVerificationEndPoint { mData in
                        do{
                            print("#RegisterOtp Response \(JSON(mData))")
                            let jsonDecoder = JSONDecoder()
                            let responseModel = try   jsonDecoder.decode(RegisterVerifyOtp_Base.self, from: mData)
                            if (responseModel.httpcode == 200)  {
                                self.goToHomePage()    }else{
                                    self.view.makeToast("\(responseModel.message ?? "")")
                                } }catch{
                                }}}}
            else{
                self.view.makeToast(ErrorMsg.invalidOtp.rawValue)
            }
        }catch{}
    }
    
    @IBAction func clickResndOtp(_ sender: Any) {
        let otpVerificationMasterClass = OtpVerificationMasterClass( countryCode: self.countryCode.replacingOccurrences(of: "+", with: "") , phoneNumber: self.phonenumber)
        
        otpVerificationMasterClass.ResendOtpEndPoint { mData in
            
        }
    }
    
    //MARK: - NavigationController
    func goToHomePage (){
        let storyBoard : UIStoryboard = UIStoryboard(name: "HomeMain", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CustomeTabBarController") as! CustomeTabBarController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func goToOtpPage (){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "VerificationOtpVC") as! VerificationOtpVC
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}
