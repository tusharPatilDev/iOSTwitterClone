//
//  TweetTVC.swift
//  Twitter Clone
//
//  Created by HackinTushar on 01/03/23.
//

import UIKit

class TweetTVC: UITableViewCell {
    private let usernameLbl = UILabel()
    private let twitterUsernameLbl = UILabel()
    private let profileImg = UIImageView()
    private let tweetLbl = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.addSubview(profileImg)
        profileImg.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImg.heightAnchor.constraint(equalToConstant: 50),
            profileImg.widthAnchor.constraint(equalToConstant: 50),
            profileImg.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 16),
            profileImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16)
        ])
        profileImg.backgroundColor = .red
        profileImg.layer.cornerRadius = 25
        
        contentView.addSubview(usernameLbl)
        usernameLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameLbl.leadingAnchor.constraint(equalTo: profileImg.trailingAnchor,constant: 8),
            usernameLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -8),
            usernameLbl.topAnchor.constraint(equalTo: profileImg.topAnchor)
        ])
        usernameLbl.font = FontUtility.shared.getFont(font: .helveticaNeueBold, size: 18)
        usernameLbl.text = "Elon Musk"
        
        contentView.addSubview(twitterUsernameLbl)
        twitterUsernameLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            twitterUsernameLbl.leadingAnchor.constraint(equalTo: usernameLbl.leadingAnchor),
            twitterUsernameLbl.trailingAnchor.constraint(equalTo: usernameLbl.trailingAnchor),
            twitterUsernameLbl.topAnchor.constraint(equalTo: usernameLbl.bottomAnchor,constant: 0),
        ])
        twitterUsernameLbl.font = FontUtility.shared.getFont(font: .helveticaNeueMedium, size: 16)
        twitterUsernameLbl.textColor = .lightGray
        twitterUsernameLbl.text = "@elon_musk - 4h"
        
        contentView.addSubview(tweetLbl)
        tweetLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tweetLbl.topAnchor.constraint(equalTo: twitterUsernameLbl.bottomAnchor),
            tweetLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -40),
            tweetLbl.leadingAnchor.constraint(equalTo: usernameLbl.leadingAnchor),
            tweetLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16)
        ])
        tweetLbl.numberOfLines = 0
        tweetLbl.text = "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32."
        
        let stackView = UIStackView()
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: 0),
            stackView.heightAnchor.constraint(equalToConstant: 40),
            stackView.leadingAnchor.constraint(equalTo: tweetLbl.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: tweetLbl.trailingAnchor)
        ])
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        let commentBtn = UIButton()
        stackView.addArrangedSubview(commentBtn)
        commentBtn.setImage(UIImage(systemName: "message"), for: .normal)
        commentBtn.setTitle(" 1 ", for: .normal)
        commentBtn.setTitleColor(.systemBlue, for: .normal)
        
        let retweetBtn = UIButton()
        stackView.addArrangedSubview(retweetBtn)
        retweetBtn.setImage(UIImage(systemName: "repeat"), for: .normal)
        retweetBtn.setTitle(" 450 ", for: .normal)
        retweetBtn.setTitleColor(.systemBlue, for: .normal)
        
        let likeBtn = UIButton()
        stackView.addArrangedSubview(likeBtn)
        likeBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        likeBtn.setTitle(" 1200 ", for: .normal)
        likeBtn.setTitleColor(.systemBlue, for: .normal)
        
        let statsBtn = UIButton()
        stackView.addArrangedSubview(statsBtn)
        statsBtn.setImage(UIImage(systemName: "chart.bar.xaxis"), for: .normal)
        statsBtn.setTitle(" 24k ", for: .normal)
        statsBtn.setTitleColor(.systemBlue, for: .normal)
        
        let shareBtn = UIButton()
        stackView.addArrangedSubview(shareBtn)
        shareBtn.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
