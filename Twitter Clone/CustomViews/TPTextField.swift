//
//  TPTextField.swift
//  Twitter Clone
//
//  Created by HackinTushar on 18/12/22.
//

import UIKit

class TPTextField: UIView {
    private let titleLbl = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setTitle(title:String){
        titleLbl.text = title
    }
    private func setupViews(){
        addSubview(titleLbl)
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: topAnchor,constant: -10),
            titleLbl.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            titleLbl.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16)
        ])
        layer.borderColor = UIColor.systemBlue.cgColor
        layer.borderWidth = 3
        layer.cornerRadius = 8
    }
}
