//
//  ViewController.swift
//  bigbasket
//
//  Created by Deepu S on 11/08/22.
//

import UIKit
import CountryPickerView
import Toast_Swift

class LoginPageViewController: UIViewController, CountryPickerViewDelegate {
    
    @IBOutlet weak var BackViewMobielNumber: UIView!
    @IBOutlet weak var countryPickerView: CountryPickerView!
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
        
        BackViewMobielNumber.viewSetcornerRadius(radius: 4,showShadow: false)
        userDefaultClass.setUserDefaultString(value: "en", key: .userLanguage)
        countryPickerView.delegate = self
        countryPickerView.showCountryCodeInView = false
        countryPickerView.showPhoneCodeInView = true
        countryPickerView.flagImageView.isHidden = false
        
        countryPickerView.showCountryNameInView = false
        countryPickerView.flagImageView.isHidden = true
        countryPickerView.font = UIFont.systemFont(ofSize: 14.0)
        self.countryPickerView.setCountryByPhoneCode("+966")
        
        //  UIView.appearance().semanticContentAttribute = "ar" == "ar" ? .forceRightToLeft :.forceLeftToRight
        btnSendOtp.btnCorner()
        btnSendOtp.titleLabel?.font = UIFont(name: "POPPINS-REGULAR", size: 1)
        btnSendOtp.setTitle("sendOtp".localizableString(), for: .normal)
        viewBackView.viewRoundCorners(with: .top,radius: 14)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.isHiddenNavigationBar(true)
        self.navigationController?.navigationBar.tintColor = UIColor.white;
    }
    override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
        //self.isHiddenNavigationBar(false)
    }
    
    //MARK: - Action
    @IBAction func clickSkip(_ sender: Any) {
        goToHomePage()
    }
    
    @IBAction func clickLoginEmail(_ sender: Any) {
        goToLoginEmail()
    }
    @IBAction func clickForgotPassword(_ sender: Any) {
        goToForgotPassword()
    }
    @IBAction func btnRegister(_ sender: Any) {
        goToSingUp()
    }
    @IBAction func SendOtp(_ sender: Any) {
        
        let userAccountMasterClass = UserAccountMasterClass(phoneNumber: "\(textPhoneNumber.text!)",contryCode: selectedContryCode)
        do{
            if(try userAccountMasterClass.loginCredentialsVerification()){
                
                self.StartSpiner()
        userAccountMasterClass.loginEndPoint { mdata in
          
            do {
                self.StopSpiner()
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(sendOtp_Base.self, from: mdata)
                self.view.makeToast(responseModel.message)
                if responseModel.httpcode == 200 {
                   
                    self.goToOtpPage()
                }
                else{
                    
                }
                print("#Message: \(responseModel.message ?? "")" )
            }catch{
                
            }
        }
            }
        }catch{
            self.StopSpiner()
            self.view.makeToast("\(ErrorMsg.invalidPhoneNumber.rawValue)")
        }
    }
    //MARK: - NavigationController
    
    func goToLoginEmail (){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginByEmailViewController") as! LoginByEmailViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
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
    func goToHomePage (){
        let storyBoard : UIStoryboard = UIStoryboard(name: "HomeMain", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CustomeTabBarController") as! CustomeTabBarController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    //MARK:  - Delegate
    
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        countryPickerView.setCountryByCode(country.phoneCode)
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
