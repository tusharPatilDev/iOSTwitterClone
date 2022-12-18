//
//  ViewController.swift
//  Twitter Clone
//
//  Created by HackinTushar on 18/12/22.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    private func setupViews(){
        view.backgroundColor = .systemBackground
        
        let img = UIImageView()
        view.addSubview(img)
        img.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            img.heightAnchor.constraint(equalToConstant: 35),
            img.widthAnchor.constraint(equalToConstant: 35),
            img.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            img.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        img.image = #imageLiteral(resourceName: "icTwitter")
        
        let seeWorldLbl = UILabel()
        view.addSubview(seeWorldLbl)
        seeWorldLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            seeWorldLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            seeWorldLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 30),
            seeWorldLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -30)
        ])
        seeWorldLbl.text = "See what's\nhappening in the\nworld right now."
        seeWorldLbl.textColor = .black
        seeWorldLbl.numberOfLines = 0
        seeWorldLbl.font = FontUtility.shared.getFont(font: .helveticaNeueBold, size: 30)
        
        let createAccountBtn = UIButton()
        view.addSubview(createAccountBtn)
        createAccountBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            createAccountBtn.topAnchor.constraint(equalTo: seeWorldLbl.bottomAnchor,constant: 20),
            createAccountBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            createAccountBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            createAccountBtn.heightAnchor.constraint(equalToConstant: 45)
        ])
        createAccountBtn.layer.cornerRadius = 22.5
        createAccountBtn.setTitle("Create account", for: .normal)
        createAccountBtn.backgroundColor = .systemBlue
        createAccountBtn.setTitleFont(font: .helveticaNeueBold, size: 18)
        
        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -5)
        ])
        let haveAnAccountLbl = UILabel()
        stackView.addArrangedSubview(haveAnAccountLbl)
        haveAnAccountLbl.text = "Have an account already? "
        haveAnAccountLbl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        haveAnAccountLbl.font = FontUtility.shared.getFont(font: .helveticaNeueMedium, size: 15)
        let loginBtn = UIButton()
        stackView.addArrangedSubview(loginBtn)
        loginBtn.setTitle("Log in", for: .normal)
        loginBtn.setTitleFont(font: .helveticaNeueBold, size: 15)
        loginBtn.setTitleColor(.systemBlue, for: .normal)
    }


}

