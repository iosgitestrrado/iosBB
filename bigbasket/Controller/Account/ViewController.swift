//
//  ViewController.swift
//  bigbasket
//
//  Created by Deepu S on 11/08/22.
//

import UIKit
import CountryPickerView
import Toast_Swift

class ViewController: UIViewController, CountryPickerViewDelegate {
   
    @IBOutlet weak var CPV: CountryPickerView!
    @IBOutlet weak var btnForgotPassword: UIStackView!
    
    @IBOutlet weak var textPhoneNumber: UITextField!
    
    
    @IBOutlet weak var btnLoginEmail: UIButton!
    @IBOutlet weak var viewBackView: UIView!
    @IBOutlet weak var btnSendOtp: UIButton!
    
    var selectedContryCode = ""
    let userDefaultClass = UserDefaultClass()
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        userDefaultClass.setUserDefaultString(value: "en", key: .userLanguage)
        CPV.delegate = self
        CPV.showCountryCodeInView = false
       CPV.showPhoneCodeInView = true
        CPV.flagImageView.isHidden = false
        
        CPV.showCountryNameInView = false
        self.CPV.setCountryByPhoneCode("+966")
        
     //  UIView.appearance().semanticContentAttribute = "ar" == "ar" ? .forceRightToLeft :.forceLeftToRight
        btnSendOtp.btnCorner()
        btnSendOtp.titleLabel?.font = UIFont(name: "POPPINS-REGULAR", size: 1)
        btnSendOtp.setTitle("sendOtp".localizableString(), for: .normal)
        viewBackView.viewRoundCorners(with: .top)
    }
    override func viewWillAppear(_ animated: Bool) {
       
    }

//MARK: - Action
    
    @IBAction func clickForgotPassword(_ sender: Any) {
        goToForgotPassword()
    }
    @IBAction func btnRegister(_ sender: Any) {
        goToSingUp()
    }
    @IBAction func SendOtp(_ sender: Any) {
        
        let userAccountMasterClass = UserAccountMasterClass(phoneNumber: "\(textPhoneNumber.text!)",contryCode: selectedContryCode.replacingOccurrences(of: "+", with: ""))
        do{
            if(try userAccountMasterClass.loginCredentialsVerification()){
                
            }
        }catch{
            self.view.makeToast("\(ErrorMsg.invalidPhoneNumber.rawValue)")
        }
        
        userAccountMasterClass.loginEndPoint { mdata in
            do {
    let jsonDecoder = JSONDecoder()
    let responseModel = try jsonDecoder.decode(sendOtp_Base.self, from: mdata)
                self.view.makeToast(responseModel.message)
                if responseModel.httpcode == 200 {
                    self.goToOtpPage()
                }
                print("#Message: \(responseModel.message ?? "")" )
            }catch{
                
            }
        }
            
        }
    //MARK: - NavigationController
    
    func goToForgotPassword (){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    func goToSingUp (){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func goToOtpPage (){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "VerificationOtpVC") as! VerificationOtpVC
        nextViewController.isLoginPage = true
        nextViewController.phonenumber = self.textPhoneNumber.text!
        nextViewController.countryCode = selectedContryCode.replacingOccurrences(of: "+", with: "")
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    //MARK:  - Delegate
    
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        CPV.setCountryByCode(country.phoneCode)
        selectedContryCode = "\(country.phoneCode)"
        print(country.phoneCode)
    }
    
    func countryPickerView(_ countryPickerView: CountryPickerView, willShow viewController: CountryPickerViewController) {
        
    }
    
    func countryPickerView(_ countryPickerView: CountryPickerView, didShow viewController: CountryPickerViewController) {
        
    }
        
    }

func languageUpdate(languageSelected: Language){
    
    
    
   // Bundle.setLanguage(languageSelected.keyValue)
    //self.SetLanguagesUI()
}

extension String{
    func localizableString()->String{
        let userDefaultClass = UserDefaultClass()
        let languageKey = userDefaultClass.getUserDefaultString(key: .userLanguage)
        let path = Bundle.main.path(forResource: languageKey, ofType: "lproj")
        let bundel = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundel!, value: "", comment: "")
    }
}
