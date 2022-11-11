//
//  Extension.swift
//  bigbasket
//
//  Created by Deepu S on 16/08/22.
//

import Foundation
import UIKit
import Toast_Swift
enum RoundType {
    case top
    case none
    case bottom
    case both
}

extension String {
    //MARK:ValidPhoneNumber
    func isValidPhone()-> Bool {
            let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return phoneTest.evaluate(with: self)
        }
    //MARK: - Valid Email
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    //MARK: - ValidPassword
    
    func isValidPassword() -> Bool {
        // least one uppercase,
        // least one digit
        // least one lowercase
        // least one symbol
        //  min 8 characters total
        let password = self.trimmingCharacters(in: CharacterSet.whitespaces)
        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return passwordCheck.evaluate(with: password)

    }
}
extension Double {}

extension UIButton {
    func btnCorner() {
        layer.cornerRadius = 10
        clipsToBounds = true
        self.backgroundColor = UIColor.SecondaryColor()
        self.tintColor = UIColor.SecondaryColor5()
    }
}
extension UIColor{
    class func primarycolor() -> UIColor{
        return UIColor(named: "PrimaryColor")!
    }
    class func SecondaryColor () -> UIColor{
        return UIColor(named: "SecondaryColor")!
    }
    class func SecondaryColor2() -> UIColor{
        return UIColor(named: "SecondaryColor2")!
    }
    class func SecondaryColor3() -> UIColor{
        return UIColor(named: "SecondaryColor3")!
    }
    class func SecondaryColor4() -> UIColor{
        return UIColor(named: "SecondaryColor4")!
    }
    class func SecondaryColor5() -> UIColor{
        return UIColor(named: "SecondaryColor5")!
    }
}

extension UIView {
    
    
    func ShowMessage(message:String){
        self.makeToast(message)
    }
    
  
      func addDashedBorder() {
        let color = UIColor.systemGreen.cgColor
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)

        shapeLayer.bounds = shapeRect
          shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 2
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [6,3]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 4).cgPath
        self.layer.addSublayer(shapeLayer)
    }
    
    func AddShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 4.0
        self.layer.masksToBounds = true
    }
    func viewSetcornerRadiusRedColor(radius: CGFloat,showShadow:Bool = true){
        if showShadow {
            self.layer.masksToBounds = false
            self.layer.shadowColor =  UIColor(red:187/255, green:187/255, blue:187/255, alpha: 1).cgColor
            self.layer.shadowOpacity = 0.5
            self.layer.shadowOffset = CGSize(width: 2, height:0)
            self.layer.shadowRadius = radius
        }
      
        self.layer.borderWidth = 1
        self.layer.cornerRadius = radius;
        self.layer.borderColor = UIColor(red:255/255, green:59/255, blue:48/255, alpha: 1).cgColor
        //self.layer.masksToBounds = true;
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOpacity = 0.8
//        self.layer.shadowRadius = 3.0
//        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    }
    
    func viewSetcornerRadius(radius: CGFloat,showShadow:Bool = true){
        if showShadow {
            self.layer.masksToBounds = false
            self.layer.shadowColor =  UIColor(red:187/255, green:187/255, blue:187/255, alpha: 1).cgColor
            self.layer.shadowOpacity = 0.5
            self.layer.shadowOffset = CGSize(width: 2, height:0)
            self.layer.shadowRadius = radius
        }
      
        self.layer.borderWidth = 1
        self.layer.cornerRadius = radius;
        self.layer.borderColor = UIColor(red:245/255, green:247/255, blue:251/255, alpha: 1).cgColor //UIColor(red:187/255, green:187/255, blue:187/255, alpha: 1).cgColor //UIColor(red:245/255, green:247/255, blue:251/255, alpha: 1).cgColor
        
    }
    
    func viewSetcornerRadiusBlueColor(radius: CGFloat,showShadow:Bool = true){
        if showShadow {
            self.layer.masksToBounds = false
            self.layer.shadowColor =  UIColor(red:187/255, green:187/255, blue:187/255, alpha: 1).cgColor
            self.layer.shadowOpacity = 0.5
            self.layer.shadowOffset = CGSize(width: 2, height:0)
            self.layer.shadowRadius = radius
        }
      
        self.layer.borderWidth = 1
        self.layer.cornerRadius = radius;
        self.layer.borderColor = UIColor(red:0/255, green:112/255, blue:180/255, alpha: 1).cgColor
        
    }
    func viewSetcornerRadius2(radius: CGFloat,showShadow:Bool = true){
        if showShadow {
            self.layer.masksToBounds = false
            self.layer.shadowColor =  UIColor(red:187/255, green:187/255, blue:187/255, alpha: 1).cgColor
            self.layer.shadowOpacity = 0.5
            self.layer.shadowOffset = CGSize(width: 2, height:0)
            self.layer.shadowRadius = radius
        }
      
        self.layer.borderWidth = 1
        self.layer.cornerRadius = radius;
        self.layer.borderColor = UIColor(red:187/255, green:187/255, blue:187/255, alpha: 1).cgColor //UIColor(red:187/255, green:187/255, blue:187/255, alpha: 1).cgColor //UIColor(red:245/255, green:247/255, blue:251/255, alpha: 1).cgColor
        
    }
    func viewRoundCorners(with type: RoundType, radius: CGFloat,showBorders:Bool = false) {
        if showBorders {
            self.layer.borderWidth = 1.5
           
            self.layer.borderColor = UIColor(red:187/255, green:187/255, blue:187/255, alpha: 0.5).cgColor
        }
        
            var corners: UIRectCorner
            switch type {
            case .top:
                corners = [.topLeft, .topRight]
            case .none:
                corners = []
            case .bottom:
                corners = [.bottomLeft, .bottomRight]
            case .both:
                corners = [.allCorners]
            }

            DispatchQueue.main.async {
                let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
                let mask = CAShapeLayer()
                mask.path = path.cgPath
                self.layer.mask = mask
            }
        
        
        }

}
extension String{
    func localizableString(loc : String)-> String{
        let path =  Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "                      ", comment: "")
    }
}

fileprivate var aView : UIView?
extension UIViewController {
    func StartSpiner(){
         aView = UIView(frame:self.view.bounds)
        aView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView(style: .whiteLarge)
        ai.center = aView!.center
        ai.startAnimating()
        aView!.addSubview(ai)
        self.view.addSubview(aView!)
        
    }
    func StopSpiner(){
        aView?.removeFromSuperview()
        aView = nil
    }
    
    func isHiddenNavigationBar(_ bool:Bool){
        self.navigationController?.navigationBar.isHidden = bool
    }
}
