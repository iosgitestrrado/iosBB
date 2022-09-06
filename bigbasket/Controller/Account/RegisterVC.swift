//
//  RegisterVC.swift
//  bigbasket
//
//  Created by Deepu S on 17/08/22.
//

import UIKit
import CountryPickerView
import SwiftyJSON
import Toast_Swift

class RegisterVC: UIViewController, CountryPickerViewDelegate {
    
    
    @IBOutlet weak var countryPickerView: CountryPickerView!
    @IBOutlet weak var textPhoneNumber: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var txtPasswordConfirmation: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textName: UITextField!
    
    var countryCode = ""
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        countryPickerView.delegate = self
        countryPickerView.showCountryCodeInView = false
        countryPickerView.showPhoneCodeInView = true
        countryPickerView.flagImageView.isHidden = false
        
        countryPickerView.showCountryNameInView = false
        self.countryPickerView.setCountryByPhoneCode("+966")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func BtnSendOtp(_ sender: Any) {
        
        let signupMasterClass = SignUpMasterClass(email: textEmail.text!, name: textName.text!, phoneNumber: textPhoneNumber.text!, countryCode: countryCode.replacingOccurrences(of: "+", with: ""),password: textPassword.text!,passwordConfirmation: txtPasswordConfirmation.text!)
        do {
            if(try signupMasterClass.loginCredentialsVerification()) {
                signupMasterClass.RegisterEndPoint { mData in
                    
                    do{
                        print(JSON(mData))
                        let jsonDecoder = JSONDecoder()
                        let responseModel = try jsonDecoder.decode(Register_Base.self, from: mData)
                        if (responseModel.httpcode == 200)  {
                            self.goToOtpPage()
                        }else{
                            self.view.makeToast("\(responseModel.error?.first ?? "")")
                        } }catch{
                            
                        }}}
        }catch{
            self.view.makeToast("\(error)")
        }
    }
    //MARK: - countryPickerView Delegate
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        countryCode = country.phoneCode
    }
    
    func countryPickerView(_ countryPickerView: CountryPickerView, willShow viewController: CountryPickerViewController) {
        
    }
    
    func countryPickerView(_ countryPickerView: CountryPickerView, didShow viewController: CountryPickerViewController) {
        
    }
    
    func goToOtpPage (){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "VerificationOtpVC") as! VerificationOtpVC
        nextViewController.phonenumber = textPhoneNumber.text!
        nextViewController.countryCode = countryCode
        nextViewController.isLoginPage = false
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}
