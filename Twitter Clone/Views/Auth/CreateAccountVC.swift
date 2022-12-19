//
//  CreateAccountVC.swift
//  Twitter Clone
//
//  Created by HackinTushar on 18/12/22.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
    }
    private func setupViews(){
        let appBar = NavigationBar()
        view.addSubview(appBar)
        appBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            appBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            appBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            appBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        appBar.backImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backBtnAction)))
        
        let createAccountLbl = UILabel()
        view.addSubview(createAccountLbl)
        createAccountLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            createAccountLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            createAccountLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            createAccountLbl.topAnchor.constraint(equalTo: appBar.bottomAnchor,constant: 20)
        ])
        createAccountLbl.text = "Create your account"
        createAccountLbl.font = FontUtility.shared.getFont(font: .helveticaNeueBold, size: 25)
        createAccountLbl.textColor = .black
        
        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        let tfName = TPTextField()
        stackView.addArrangedSubview(tfName)
        tfName.translatesAutoresizingMaskIntoConstraints = false
        tfName.setTitle(title: "Name")
        NSLayoutConstraint.activate([
            tfName.heightAnchor.constraint(equalToConstant: 70)
        ])
        
    }
    @objc func backBtnAction(){
        navigationController?.popViewController(animated: true)
    }
}
