//
//  ProfileViewController.swift
//  Instagram Clone
//
//  Created by wassim on 30/10/2021.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func goToSettings(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "General", bundle: nil)

        let settingVc = storyboard.instantiateViewController(identifier: "SettingsViewController")
        settingVc.modalPresentationStyle = .fullScreen
        settingVc.title = AppHelper.getLocalizeString(str: "setting_vc_title")
        navigationController?.pushViewController(settingVc, animated: true)
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
