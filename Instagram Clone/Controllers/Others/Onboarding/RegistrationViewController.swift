//
//  RegistrationViewController.swift
//  Instagram Clone
//
//  Created by wassim on 30/10/2021.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var newAccountLbl: UILabel!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTxt.delegate = self
        emailTxt.delegate = self
        passwordTxt.delegate = self
        uiConfig()

        // Do any additional setup after loading the view.
    }

    // MARK:- UI-Configs
    fileprivate func uiConfig() {
        newAccountLbl.text = AppHelper.getLocalizeString(str: "create_account_title")
        usernameTxt.placeholder = AppHelper.getLocalizeString(str: "username_placeholder")
        emailTxt.placeholder = AppHelper.getLocalizeString(str: "email_placeholder")
        passwordTxt.placeholder = AppHelper.getLocalizeString(str: "pass_input_placeholder")
        registerBtn.setTitle(AppHelper.getLocalizeString(str: "register_btn_title"), for: .normal)

        registerBtn.clipsToBounds = true
        registerBtn.layer.cornerRadius = 5

    }
    

    // MARK:- Actions

    @IBAction func registerClick(_ sender: Any) {
        usernameTxt.resignFirstResponder()
        emailTxt.resignFirstResponder()
        passwordTxt.resignFirstResponder()
        guard let username = usernameTxt.text,!username.isEmpty,
              let email = emailTxt.text,!email.isEmpty,
              let password = passwordTxt.text,!password.isEmpty,password.count >= 8 else {
            return
        }
        AuthManager.shared.registerNewUser(username: username, email: email, password: password) { registered in
            DispatchQueue.main.async {
                if registered {

                }else{
                    // failed
                }
            }
        }

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension RegistrationViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTxt{
            emailTxt.becomeFirstResponder()
        }else if textField == emailTxt{
            passwordTxt.becomeFirstResponder()
        }else{
            registerClick(self)
        }
        return true
    }
}
