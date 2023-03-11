//
//  CurrentUserProfileTVC.swift
//  Twitter Clone
//
//  Created by HackinTushar on 11/03/23.
//

import UIKit

class CurrentUserProfileTVC: UITableViewCell {
    
    private let fullNameLbl = UILabel()
    private let usernameLbl = UILabel()
    private let editProfileBtn = UIButton()
    private var profileTopConstraint:NSLayoutConstraint?
    
    static let cellIdentifer = "CurrentUserProfileTVC"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initViews()
    }
    private func initViews(){
        let profileImgView = UIView()
        addSubview(profileImgView)
        profileImgView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            profileImgView.widthAnchor.constraint(equalToConstant: 100),
            profileImgView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        profileTopConstraint =  profileImgView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: -40)
        profileTopConstraint?.isActive = true
        
        profileImgView.layer.cornerRadius = 50
        profileImgView.backgroundColor = .systemBackground

        let profileImg = UIImageView()
        profileImgView.addSubview(profileImg)
        profileImg.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImg.leadingAnchor.constraint(equalTo: profileImgView.leadingAnchor,constant: 5),
            profileImg.trailingAnchor.constraint(equalTo: profileImgView.trailingAnchor,constant: -5),
            profileImg.bottomAnchor.constraint(equalTo: profileImgView.bottomAnchor,constant: -5),
            profileImg.topAnchor.constraint(equalTo: profileImgView.topAnchor,constant: 5)
        ])

        
        profileImg.image = #imageLiteral(resourceName: "elonStaticProfile")
        profileImg.contentMode = .scaleAspectFill
        profileImg.clipsToBounds = true
        profileImgView.clipsToBounds = true
        profileImg.layoutIfNeeded()
        profileImg.layer.cornerRadius = profileImg.frame.height/2
        
        addSubview(fullNameLbl)
        fullNameLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fullNameLbl.topAnchor.constraint(equalTo: profileImgView.bottomAnchor,constant: 8),
            fullNameLbl.leadingAnchor.constraint(equalTo: profileImgView.leadingAnchor,constant: 0),
            fullNameLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: 20)
        ])
        fullNameLbl.font = FontUtility.shared.getFont(font: .helveticaNeueBold, size: 16)
        fullNameLbl.text = "Elon Musk"
        
        addSubview(usernameLbl)
        usernameLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameLbl.leadingAnchor.constraint(equalTo: fullNameLbl.leadingAnchor),
            usernameLbl.trailingAnchor.constraint(equalTo: fullNameLbl.trailingAnchor),
            usernameLbl.topAnchor.constraint(equalTo: fullNameLbl.bottomAnchor)
        ])
        usernameLbl.font = FontUtility.shared.getFont(font: .helveticaNeueMedium, size: 16)
        usernameLbl.textColor = .gray
        usernameLbl.text = "@elon_musk"
        
        addSubview(editProfileBtn)
        editProfileBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editProfileBtn.heightAnchor.constraint(equalToConstant: 30),
            editProfileBtn.widthAnchor.constraint(equalToConstant: 100),
            editProfileBtn.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 16),
            editProfileBtn.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16)
        ])
        editProfileBtn.setTitle("Edit profile", for: .normal)
        editProfileBtn.setTitleColor(.darkGray, for: .normal)
        editProfileBtn.layer.cornerRadius = 15
        editProfileBtn.layer.borderColor = UIColor.gray.cgColor
        editProfileBtn.layer.borderWidth = 0.5
        editProfileBtn.setTitleFont(font: .helveticaNeueMedium, size: 15)
    }
    func bringProfilePicDown(){
        UIView.animate(withDuration: 1.5) {
            self.profileTopConstraint?.constant = 16
            self.layoutIfNeeded()
        }
    }
    func bringProfilePicUp(){
        UIView.animate(withDuration: 1.5) {
            self.profileTopConstraint?.constant = -40
            self.layoutIfNeeded()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
