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
        collectionView.register(UINib(nibName: "ProfileInfoHeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProfileInfoHeaderCollectionReusableView")
        collectionView.register(UINib(nibName: "ProfileTabsCollectionReusableView",bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProfileTabsCollectionReusableView")

    }
    

    @IBAction func goToSettings(_ sender: Any) {
        let settingVc = AppHelper.initVcFromStoryboard(storyboardName: "General", vcIdentifier: "SettingsViewController")
        settingVc.title = AppHelper.getLocalizeString(str: "setting_vc_title")
        navigationController?.pushViewController(settingVc, animated: true)
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,ProfileProtocol {
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
        //postVc.model = nil
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
            tabsHeader.delegate = self
            return tabsHeader
        }
        let profileHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProfileInfoHeaderCollectionReusableView", for: indexPath) as! ProfileInfoHeaderCollectionReusableView
        //profileHeader.postNbLbl.text = "100"
        profileHeader.delegate = self
        return profileHeader
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        /// header size
        if section == 0 {
            let indexPath = IndexPath(row: 0, section: section)
            let headerView = self.collectionView(collectionView, viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionHeader, at: indexPath)
            // make size fit contents
            return headerView.systemLayoutSizeFitting(CGSize(width: collectionView.frame.width, height: collectionView.frame.height), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        }
        /// section tabs size
        return CGSize(width: collectionView.bounds.width, height: 50)
    }

    //MARK:- ProfileProtocolDelegate

    func didTapEditProfile(header profileHeader: ProfileInfoHeaderCollectionReusableView) {
        print("edit click")
        let vc = AppHelper.initVcFromStoryboard(storyboardName: "General", vcIdentifier: "EditProfileViewController")
        vc.title = AppHelper.getLocalizeString(str: "edit_profile_title")
        let navController = UINavigationController(rootViewController: vc)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)

    }

    func didTapPostView(header profileHeader: ProfileInfoHeaderCollectionReusableView) {
        /// scroll to post list
        collectionView.scrollToItem(at: IndexPath(row: 0, section: 1), at: .top, animated: true)
    }

    func didTapFollowersView(header profileHeader: ProfileInfoHeaderCollectionReusableView) {
        //print("followers click")
        let vc = AppHelper.initVcFromStoryboard(storyboardName: "General", vcIdentifier: "ListViewController") as! ListViewController
        let mockData = [
            UserRelationship(username: "wassimmou", name: "wassimBh", type: .following),
            UserRelationship(username: "kings", name: "johnDoe", type: .not_following),
            UserRelationship(username: "zultra", name: "John Test", type: .following),
        ]
        vc.data = mockData
        vc.title = AppHelper.getLocalizeString(str: "followers_title")
        navigationController?.pushViewController(vc, animated: true)

    }

    func didTapFollowingView(header profileHeader: ProfileInfoHeaderCollectionReusableView) {
        //print("following click")
        let vc = AppHelper.initVcFromStoryboard(storyboardName: "General", vcIdentifier: "ListViewController") as! ListViewController
        let mockData = [
            UserRelationship(username: "testing", name: "User@", type: .following),
            UserRelationship(username: "mc1", name: "mickel conord", type: .not_following),
            UserRelationship(username: "software engineer", name: "teach ios", type: .following),
        ]
        vc.data = mockData
        vc.title = AppHelper.getLocalizeString(str: "following_title")
        navigationController?.pushViewController(vc, animated: true)

    }


    func didTapGridBtn(header profileHeader: ProfileTabsCollectionReusableView) {
        print("grid tapped")
    }

    func didTapTagBtn(header profileHeader: ProfileTabsCollectionReusableView) {
        print("tag tapped")

    }
}
