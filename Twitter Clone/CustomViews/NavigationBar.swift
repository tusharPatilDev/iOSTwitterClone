//
//  NavigationBar.swift
//  Twitter Clone
//
//  Created by HackinTushar on 18/12/22.
//

import UIKit

class NavigationBar: UIView {
    let backImg = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        backImg.isUserInteractionEnabled = true
        addSubview(backImg)
        backImg.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backImg.heightAnchor.constraint(equalToConstant: 20),
            backImg.widthAnchor.constraint(equalToConstant: 20),
            backImg.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            backImg.topAnchor.constraint(equalTo: topAnchor)
        ])
        backImg.image = UIImage(systemName: "chevron.backward")
        backImg.contentMode = .scaleAspectFill
        
        let appImg = UIImageView()
        addSubview(appImg)
        appImg.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appImg.centerXAnchor.constraint(equalTo: centerXAnchor),
            appImg.topAnchor.constraint(equalTo: topAnchor),
            appImg.heightAnchor.constraint(equalToConstant: 35),
            appImg.widthAnchor.constraint(equalToConstant: 35)
        ])
        appImg.image = #imageLiteral(resourceName: "icTwitter")
    }
}
