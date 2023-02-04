//
//  TagCVC.swift
//  Twitter Clone
//
//  Created by HackinTushar on 04/02/23.
//

import UIKit

class TagCVC: UICollectionViewCell {
    
    static let cellIdentifer = "TagCVC"
    private let tagTitleLbl = UILabel()
    let mainView = UIView()
    
    var tagTitle:String = ""{
        didSet{
            tagTitleLbl.text = tagTitle
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    private func initViews(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        contentView.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5)
        ])
        contentView.layoutIfNeeded()
        mainView.layoutIfNeeded()
        mainView.layer.cornerRadius = mainView.frame.height/2
        mainView.layer.borderColor = UIColor.systemGray4.cgColor
        mainView.layer.borderWidth = 1
        
        mainView.addSubview(tagTitleLbl)
        tagTitleLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagTitleLbl.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 10),
            tagTitleLbl.bottomAnchor.constraint(equalTo: mainView.bottomAnchor,constant: -10),
            tagTitleLbl.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -20),
            tagTitleLbl.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 20)
        ])
        tagTitleLbl.font = FontUtility.shared.getFont(font: .helveticaNeueMedium, size: 16)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
