//
//  ForgotPasswordVC.swift
//  bigbasket
//
//  Created by Deepu S on 26/08/22.
//

import UIKit
import CountryPickerView
import Toast_Swift

class ForgotPasswordVC: UIViewController, CountryPickerViewDelegate {
    
    
    @IBOutlet weak var countryPickerView: CountryPickerView!
    
    @IBOutlet weak var textPhoneNumber: UITextField!
    var selectedContryCode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryPickerView.delegate = self
        countryPickerView.showCountryCodeInView = false
        countryPickerView.showPhoneCodeInView = true
        countryPickerView.flagImageView.isHidden = false
        countryPickerView.showCountryNameInView = false
        countryPickerView.setCountryByPhoneCode("+966")
    }
    
    
    //MARK: - Action
    
    
    @IBAction func clickSendOtp(_ sender: Any) {
        let forgotPasswordMasterClass = ForgotPasswordMasterClass(phoneNumber: textPhoneNumber.text!, contryCode: selectedContryCode)
        do {
            if try forgotPasswordMasterClass.loginCredentialsVerification(){
                
            }
            else{}
        }catch{}
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
