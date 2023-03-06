//
//  UserProfileVC.swift
//  Twitter Clone
//
//  Created by HackinTushar on 06/03/23.
//

import UIKit

class UserProfileVC: UIViewController {
    private let coverProfileImg = UIImageView()
    private var profileCoverPicViewHeightConstraint:NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    private func initViews(){
        view.backgroundColor = .systemBackground
        tabBarController?.tabBar.isHidden = true
        
        let profileCoverPicView = UIView()
        view.addSubview(profileCoverPicView)
        profileCoverPicView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileCoverPicView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            profileCoverPicView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            profileCoverPicView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
        ])
        profileCoverPicViewHeightConstraint = profileCoverPicView.heightAnchor.constraint(equalToConstant: 180)
        profileCoverPicViewHeightConstraint?.isActive = true
        
        profileCoverPicView.addSubview(coverProfileImg)
        coverProfileImg.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            coverProfileImg.leadingAnchor.constraint(equalTo: profileCoverPicView.leadingAnchor),
            coverProfileImg.trailingAnchor.constraint(equalTo: profileCoverPicView.trailingAnchor),
            coverProfileImg.topAnchor.constraint(equalTo: profileCoverPicView.topAnchor),
            coverProfileImg.bottomAnchor.constraint(equalTo: profileCoverPicView.bottomAnchor)
        ])
        coverProfileImg.image = UIImage(named: "swift_orange_img")
        coverProfileImg.contentMode = .scaleAspectFill
        coverProfileImg.clipsToBounds = true
        
        let profileImgView = UIView()
        view.addSubview(profileImgView)
        profileImgView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImgView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            profileImgView.topAnchor.constraint(equalTo: profileCoverPicView.bottomAnchor,constant: -50),
            profileImgView.widthAnchor.constraint(equalToConstant: 100),
            profileImgView.heightAnchor.constraint(equalToConstant: 100)
        ])
        profileImgView.layer.cornerRadius = 50
        profileImgView.backgroundColor = .systemBackground
        view.bringSubviewToFront(profileImgView)
        
        let profileImg = UIImageView()
        profileImgView.addSubview(profileImg)
        profileImg.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImg.leadingAnchor.constraint(equalTo: profileImgView.leadingAnchor,constant: 5),
            profileImg.trailingAnchor.constraint(equalTo: profileImgView.trailingAnchor,constant: -5),
            profileImg.topAnchor.constraint(equalTo: profileImgView.topAnchor,constant: 5),
            profileImg.bottomAnchor.constraint(equalTo: profileImgView.bottomAnchor,constant: -5)
        ])
        profileImg.image = #imageLiteral(resourceName: "elonStaticProfile")
        profileImg.contentMode = .scaleAspectFill
        profileImg.clipsToBounds = true
        profileImgView.clipsToBounds = true
        profileImg.layoutIfNeeded()
        profileImg.layer.cornerRadius = profileImg.frame.height/2
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }

}
