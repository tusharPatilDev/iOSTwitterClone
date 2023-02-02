//
//  ChooseInterestCVC.swift
//  Twitter Clone
//
//  Created by HackinTushar on 02/02/23.
//

import UIKit

class ChooseInterestCVC: UICollectionViewCell {
    private let titleLbl = UILabel()
    private let checkMarkImg = UIImageView()
    private let mainView = UIView()
    var interestTitle:String?{
        didSet{
            titleLbl.text = interestTitle
        }
    }
    var isChecked:Bool = false{
        didSet{
            mainView.backgroundColor = isChecked ? .systemBlue : .systemBackground
            titleLbl.textColor = isChecked ? .white : .darkGray
            //checkMarkImg.isHidden = !isChecked
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func initViews(){
        
        addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -5),
            mainView.topAnchor.constraint(equalTo: topAnchor,constant: 5),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -8)
        ])
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.lightGray.cgColor
        
        mainView.addSubview(titleLbl)
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLbl.bottomAnchor.constraint(equalTo: mainView.bottomAnchor,constant: -8),
            titleLbl.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -8),
            titleLbl.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 8)
        ])
        mainView.layer.cornerRadius = 12
        
        mainView.addSubview(checkMarkImg)
        checkMarkImg.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkMarkImg.widthAnchor.constraint(equalToConstant: 20),
            checkMarkImg.heightAnchor.constraint(equalToConstant: 20),
            checkMarkImg.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -8),
            checkMarkImg.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 8)
        ])
        checkMarkImg.image = UIImage(systemName: "checkmark.circle.fill")
        checkMarkImg.tintColor = .white
        
        titleLbl.font = FontUtility.shared.getFont(font: .helveticaNeueBold, size: 16)
    }
}
