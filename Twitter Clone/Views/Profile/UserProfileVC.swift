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
    private let fullNameLbl = UILabel()
    private let usernameLbl = UILabel()
    private let editProfileBtn = UIButton()
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTblView()
    }
    private func initTblView(){
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
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: profileCoverPicView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        tableView.register(CurrentUserProfileTVC.self, forCellReuseIdentifier: CurrentUserProfileTVC.cellIdentifer)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.clipsToBounds = false
        
    }
    private func initViews(){
        
        
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
        
        view.addSubview(fullNameLbl)
        fullNameLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fullNameLbl.topAnchor.constraint(equalTo: profileImgView.bottomAnchor,constant: 8),
            fullNameLbl.leadingAnchor.constraint(equalTo: profileImgView.leadingAnchor,constant: 0),
            fullNameLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 20)
        ])
        fullNameLbl.font = FontUtility.shared.getFont(font: .helveticaNeueBold, size: 16)
        fullNameLbl.text = "Elon Musk"
        
        view.addSubview(usernameLbl)
        usernameLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameLbl.leadingAnchor.constraint(equalTo: fullNameLbl.leadingAnchor),
            usernameLbl.trailingAnchor.constraint(equalTo: fullNameLbl.trailingAnchor),
            usernameLbl.topAnchor.constraint(equalTo: fullNameLbl.bottomAnchor)
        ])
        usernameLbl.font = FontUtility.shared.getFont(font: .helveticaNeueMedium, size: 16)
        usernameLbl.textColor = .gray
        usernameLbl.text = "@elon_musk"
        
        view.addSubview(editProfileBtn)
        editProfileBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editProfileBtn.heightAnchor.constraint(equalToConstant: 30),
            editProfileBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            editProfileBtn.widthAnchor.constraint(equalToConstant: 100),
            editProfileBtn.topAnchor.constraint(equalTo: coverProfileImg.bottomAnchor,constant: 16)
        ])
        editProfileBtn.setTitle("Edit profile", for: .normal)
        editProfileBtn.setTitleColor(.darkGray, for: .normal)
        editProfileBtn.layer.cornerRadius = 15
        editProfileBtn.layer.borderColor = UIColor.gray.cgColor
        editProfileBtn.layer.borderWidth = 0.5
        editProfileBtn.setTitleFont(font: .helveticaNeueMedium, size: 15)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }

}
//MARK: UITableViewDeelgate,UITableViewDataSource
extension UserProfileVC: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0:
            return 200
        case 1:
            return UITableView.automaticDimension
        default:
            return UITableView.automaticDimension
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? CurrentUserProfileTVC
        cell?.bringProfilePicDown()
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("scrollviewend")
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? CurrentUserProfileTVC
        cell?.bringProfilePicUp()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CurrentUserProfileTVC.cellIdentifer) as? CurrentUserProfileTVC
            return cell!
        default:
            return UITableViewCell()
        }
        
    }
    
}
