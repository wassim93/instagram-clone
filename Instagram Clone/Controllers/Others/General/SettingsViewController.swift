//
//  SettingsViewController.swift
//  Instagram Clone
//
//  Created by wassim on 30/10/2021.
//

import UIKit

struct SettingCellModel {
    let title:String
    let handler: (()->Void)

}

/// view controller to show user settings
class SettingsViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    private var data = [[SettingCellModel]]()


    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UINib(nibName: "SettingCell", bundle: nil), forCellReuseIdentifier: "SettingCell")
        tableview.register(UINib(nibName: "SettingHeaderCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "SettingHeaderCell")
    }

    /// function for creating our list of items thats should be displayed in each section
    fileprivate func configureUI() {

        var section = [
            SettingCellModel(title: AppHelper.getLocalizeString(str: "edit_profile_title"), handler: { [weak self] in
                self?.didTapEditProfile()
            }),
            SettingCellModel(title: AppHelper.getLocalizeString(str: "invite_fr_title"), handler: { [weak self] in
                self?.didTapInviteFriends()
            }),
            SettingCellModel(title: AppHelper.getLocalizeString(str: "save_posts_title"), handler: { [weak self] in self?.didTapSavePosts()
            })
        ]
        /// appending first section items to the array
        data.append(section)
        section = [
            SettingCellModel(title: AppHelper.getLocalizeString(str: "terms_of_service"), handler: { [weak self] in
                self?.didTapTermsServices()
            }),
            SettingCellModel(title: AppHelper.getLocalizeString(str: "privacy_policy"), handler: { [weak self] in
                self?.didTapPrivacyPolicy()
            }),
            SettingCellModel(title: AppHelper.getLocalizeString(str: "help_feedback"), handler: { [weak self] in
                self?.didTapHelp()
            })
        ]

        /// appending second section items to the array
        data.append(section)
        section = [
            SettingCellModel(title: AppHelper.getLocalizeString(str: "logout_title"), handler: { [weak self] in
                self?.didTapLogout()
            })
        ]
        /// appending last section  to the array
        data.append(section)
    }


    // MARK:- Actions

    private func didTapLogout(){
        let actionSheet =  UIAlertController(title: AppHelper.getLocalizeString(str: "logout_title"), message: AppHelper.getLocalizeString(str: "logout_alert_msg"), preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: AppHelper.getLocalizeString(str: "no_msg"), style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: AppHelper.getLocalizeString(str: "logout_title"), style: .destructive, handler: { _ in
            AuthManager.shared.logOut { isLoggedOut in
                DispatchQueue.main.async {
                    if isLoggedOut{
                        let storyboard = UIStoryboard.init(name: "Onboarding", bundle: nil)

                        let loginVc = storyboard.instantiateViewController(identifier: "LoginViewController")
                        loginVc.modalPresentationStyle = .fullScreen
                        self.present(loginVc, animated: true){
                            self.navigationController?.popToRootViewController(animated: false)
                        }
                    }else{
                        fatalError("could not log out")
                    }
                }
            }
        }))
        /// this two line for preventing crash on ipad when presenting the sheet
        actionSheet.popoverPresentationController?.sourceView = tableview
        actionSheet.popoverPresentationController?.sourceRect = tableview.bounds

        present(actionSheet, animated: true)

        
    }
    private func didTapEditProfile(){
        print("profile clicked")
    }
    private func didTapInviteFriends(){
        print("invite  clicked")
    }
    private func didTapSavePosts(){
        print("save posts  clicked")
    }

    private func didTapPrivacyPolicy(){
        print("privacy  clicked")
    }
    private func didTapTermsServices(){
        print("terms  clicked")
    }

    private func didTapHelp(){
        print("help  clicked")
    }


}

// MARK: - Extension

extension SettingsViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! SettingCell
        cell.titleLbl.text = data[indexPath.section][indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
        // fire handler associated to the row
        data[indexPath.section][indexPath.row].handler()
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SettingHeaderCell") as! SettingHeaderCell
        switch section {
            case 0:
                headerView.headerTitleLbl.text = AppHelper.getLocalizeString(str: "section_setting_title")
            case 1:
                headerView.headerTitleLbl.text = AppHelper.getLocalizeString(str: "section_help_title")
            case 2:
                headerView.headerTitleLbl.text = AppHelper.getLocalizeString(str: "section_session_title")
            default:
                break
        }
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }


}
