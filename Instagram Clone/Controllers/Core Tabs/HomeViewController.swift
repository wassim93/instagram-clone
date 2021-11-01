//
//  ViewController.swift
//  Instagram Clone
//
//  Created by wassim on 30/10/2021.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {



    override func viewDidLoad() {
        super.viewDidLoad()
        checkAuthentication()

    }



    fileprivate func checkAuthentication() {
        if Auth.auth().currentUser == nil {
            let storyboard = UIStoryboard.init(name: "Onboarding", bundle: nil)

            let loginVc = storyboard.instantiateViewController(identifier: "LoginViewController")
            loginVc.modalPresentationStyle = .fullScreen
            DispatchQueue.main.async {
                self.present(loginVc, animated: false)
            }
        }
    }







}

