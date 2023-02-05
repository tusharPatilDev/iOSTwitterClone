//
//  UserProfileTVC.swift
//  Twitter Clone
//
//  Created by HackinTushar on 04/02/23.
//

import UIKit

class UserProfileTVC: UITableViewCell {
    static let cellIdentifier = "UserProfileTVC"
    private let profileImg = UIImageView()
    private let userNameLbl = UILabel()
    private let realNameLbl = UILabel()
    private let shortBioLbl = UILabel()
    private let followBtn = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initViews(){
        contentView.addSubview(profileImg)
        profileImg.translatesAutoresizingMaskIntoConstraints = false
        profileImg.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            profileImg.heightAnchor.constraint(equalToConstant: 60),
            profileImg.widthAnchor.constraint(equalToConstant: 60),
            profileImg.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            profileImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5)
        ])
        profileImg.clipsToBounds = true
        profileImg.layer.cornerRadius = 30
        contentView.addSubview(followBtn)
        followBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5),
            followBtn.heightAnchor.constraint(equalToConstant: 30),
            followBtn.topAnchor.constraint(equalTo: profileImg.topAnchor),
            followBtn.widthAnchor.constraint(equalToConstant: 90)
        ])
        followBtn.backgroundColor = .black
        followBtn.layer.cornerRadius = 15
        followBtn.setTitle("Follow", for: .normal)
        followBtn.setTitleFont(font: .helveticaNeueBold, size: 15)
        followBtn.setTitleColor(.white, for: .normal)
        
        contentView.addSubview(userNameLbl)
        userNameLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userNameLbl.leadingAnchor.constraint(equalTo: profileImg.trailingAnchor,constant: 5),
            userNameLbl.topAnchor.constraint(equalTo: profileImg.topAnchor),
            userNameLbl.trailingAnchor.constraint(equalTo: followBtn.leadingAnchor,constant: -5)
        ])
        userNameLbl.font = FontUtility.shared.getFont(font: .helveticaNeueBold, size: 16)
        userNameLbl.text = "Mr. Tweet"
        
        contentView.addSubview(realNameLbl)
        realNameLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            realNameLbl.leadingAnchor.constraint(equalTo: userNameLbl.leadingAnchor),
            realNameLbl.trailingAnchor.constraint(equalTo: userNameLbl.trailingAnchor),
            realNameLbl.topAnchor.constraint(equalTo: userNameLbl.bottomAnchor)
        ])
        realNameLbl.font = FontUtility.shared.getFont(font: .helveticaNeueMedium, size: 14)
        realNameLbl.textColor = .systemGray2
        realNameLbl.text = "@elonmusk"
        profileImg.image = #imageLiteral(resourceName: "elonStaticProfile")
        
        contentView.addSubview(shortBioLbl)
        shortBioLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shortBioLbl.leadingAnchor.constraint(equalTo: realNameLbl.leadingAnchor),
            shortBioLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5),
            shortBioLbl.topAnchor.constraint(equalTo: realNameLbl.bottomAnchor)
        ])
        shortBioLbl.text = "The Home of Football"
        shortBioLbl.font = FontUtility.shared.getFont(font: .helveticaNeueMedium, size: 14)
        shortBioLbl.numberOfLines = 2
        shortBioLbl.textColor = .black
    }
}
