//
//  LoginViewController.swift
//  Instagram Clone
//
//  Created by wassim on 30/10/2021.
//

import UIKit
import DropDown

class LoginViewController: UIViewController {

    @IBOutlet weak var selectedLanguageLbl: UILabel!
    @IBOutlet weak var languagesDropDown: UIView!

    @IBOutlet weak var newAccountLbl: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    var selectedLanguage:String = UserDefaults.standard.string(forKey: "Language")!
    let dropDown = DropDown()

    struct Constants {
        static let languages = [AppHelper.getLocalizeString(str: "en_language"), AppHelper.getLocalizeString(str: "fr_language")]
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        dropdownConfig()
        uiConfig()

    }



    // MARK:- UI-Configs

    fileprivate func uiConfig() {
        emailTxt.placeholder = AppHelper.getLocalizeString(str: "email_input_placeholder")
        passwordTxt.placeholder = AppHelper.getLocalizeString(str: "pass_input_placeholder")
        loginBtn.setTitle(AppHelper.getLocalizeString(str: "login_btn_text"), for: .normal)
        newAccountLbl.text = AppHelper.getLocalizeString(str: "new_account_text")
        if selectedLanguage == "en" {
            selectedLanguageLbl.text = AppHelper.getLocalizeString(str: "en_language")

        }else{
            selectedLanguageLbl.text = AppHelper.getLocalizeString(str: "fr_language")
        }
        loginBtn.clipsToBounds = true
        loginBtn.layer.cornerRadius = 5

        setupAttributedStringForRegister()

    }


    fileprivate func setupAttributedStringForRegister() {
        let text = newAccountLbl.text
        let underlineAttriString = NSMutableAttributedString(string: text!)
        let range1 = (text! as NSString).range(of: AppHelper.getLocalizeString(str: "new_account_title"))
        let font = UIFont.boldSystemFont(ofSize: 14)

        underlineAttriString.addAttribute(NSAttributedString.Key.font, value:font, range: range1)
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.link, range: range1)
        newAccountLbl.attributedText = underlineAttriString
        newAccountLbl.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.showRegisterView))
        newAccountLbl.addGestureRecognizer(gesture)
    }


    fileprivate func dropdownConfig() {
        dropDown.anchorView = languagesDropDown
        dropDown.dataSource = Constants.languages
        dropDown.direction = .bottom

        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)

        DropDown.appearance().selectionBackgroundColor = UIColor.lightGray
        dropDown.dismissMode = .onTap
        DropDown.appearance().cellHeight = 40

        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
           // print("Selected item: \(item) at index: \(index)")
            showAlert(alertTitle: AppHelper.getLocalizeString(str: "restart_msg"), alertMsg: AppHelper.getLocalizeString(str: "change_language_success"), buttonTxt: "OK")
            if index == 0 {
                UserDefaults.standard.set("en", forKey: "Language")
                selectedLanguageLbl.text = AppHelper.getLocalizeString(str: "en_language")
            }else{
                UserDefaults.standard.set("fr", forKey: "Language")
                selectedLanguageLbl.text = AppHelper.getLocalizeString(str: "fr_language")
            }
        }

        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.showList))
        languagesDropDown.addGestureRecognizer(gesture)
    }


    fileprivate func showAlert(alertTitle:String,alertMsg:String,buttonTxt:String) {
        let alert = UIAlertController(title: alertTitle, message: alertMsg, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: buttonTxt, style: .default, handler: nil))

        self.present(alert, animated: true)
    }


    // MARK:- Actions

    @objc func showRegisterView(sender : UITapGestureRecognizer) {
        print("register")
    }



    @objc func showList(sender : UITapGestureRecognizer) {
        dropDown.show()
    }


    @IBAction func loginClick(_ sender: Any) {
        emailTxt.resignFirstResponder()
        passwordTxt.resignFirstResponder()
        guard let userEmail = emailTxt.text else {
            return
        }
        guard let userPass = passwordTxt.text, userPass.count >= 8 else {
            print("error pass have less than 8 caracters")
            return
        }

        // login core
        var username :String?
        var email:String?
        if userEmail.contains("@"),userEmail.contains(".") {
            // this is email
            email =  userEmail
        }else{
            // this is username
            username = userEmail
        }
        AuthManager.shared.loginUser(username: username, email: email, password: userPass) { success in
            DispatchQueue.main.async {
                if success {
                    self.dismiss(animated: true, completion: nil)
                }else{
                    // error occured
                    self.showAlert(alertTitle: AppHelper.getLocalizeString(str: "login_error_title"), alertMsg: AppHelper.getLocalizeString(str: "login_error_msg"), buttonTxt: "OK")
                }
            }

        }


    }

}
