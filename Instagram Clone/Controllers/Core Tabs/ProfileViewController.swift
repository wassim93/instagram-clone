//
//  ProfileViewController.swift
//  Instagram Clone
//
//  Created by wassim on 30/10/2021.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private var userPosts = [UserPost]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        // cell
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        // headers
        collectionView.register(ProfileInfoHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProfileInfoHeaderCollectionReusableView")
        collectionView.register(ProfileTabsCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProfileTabsCollectionReusableView")

    }
    

    @IBAction func goToSettings(_ sender: Any) {
        let settingVc = AppHelper.initVcFromStoryboard(storyboardName: "General", vcIdentifier: "SettingsViewController")
        settingVc.title = AppHelper.getLocalizeString(str: "setting_vc_title")
        navigationController?.pushViewController(settingVc, animated: true)

    }


}

extension ProfileViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
        //return userPosts.count
        return 30
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width-4)/3, height: (view.frame.width-4)/3)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        //let model = userPosts[indexPath.row]
        cell.configure(debug: "goku_ultra_instinct")
        //cell.configure(with: model)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        // get the model and open post controller
        //let model = userPosts[indexPath.row]
        let postVc = AppHelper.initVcFromStoryboard(storyboardName: "General", vcIdentifier: "PostViewController") as! PostViewController
        postVc.title = AppHelper.getLocalizeString(str: "post_title")
        postVc.navigationItem.largeTitleDisplayMode = .never
        postVc.model = nil
        navigationController?.pushViewController(postVc, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            //  empty footer
            return UICollectionReusableView()
        }
        if indexPath.section == 1 {
            // tabs header
            let tabsHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProfileTabsCollectionReusableView", for: indexPath) as! ProfileTabsCollectionReusableView
            tabsHeader.backgroundColor = .red
            return tabsHeader

        }
        let profileHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProfileInfoHeaderCollectionReusableView", for: indexPath) as! ProfileInfoHeaderCollectionReusableView
        profileHeader.backgroundColor = .orange
        return profileHeader
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        /// header size
        if section == 0 {
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height/3)
        }

        /// section tabs size
        return CGSize(width: collectionView.bounds.width, height: 65)

    }


}
