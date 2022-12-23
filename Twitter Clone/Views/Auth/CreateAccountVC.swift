//
//  CreateAccountVC.swift
//  Twitter Clone
//
//  Created by HackinTushar on 18/12/22.
//

import UIKit


fileprivate let kTfHeightConstant:CGFloat = 50

class CreateAccountVC: UIViewController {
    
    private let dobPicker = UIDatePicker()
    
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
            appBar.heightAnchor.constraint(equalToConstant: 40)
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
        stackView.spacing = 12
        stackView.axis = .vertical
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        let tfName = UITextField()
        stackView.addArrangedSubview(tfName)
        tfName.placeholder = "Name"
        tfName.setHeight(height: kTfHeightConstant)
        tfName.borderStyle = .roundedRect
        tfName.addToolbar()
        
        let tfEmail = UITextField()
        stackView.addArrangedSubview(tfEmail)
        tfEmail.setHeight(height: kTfHeightConstant)
        tfEmail.placeholder = "Phone number or email address"
        tfEmail.borderStyle = .roundedRect
        tfEmail.addToolbar()
        
        
        dobPicker.preferredDatePickerStyle = .wheels
        dobPicker.datePickerMode = .date
        let tfDOB = UITextField()
        stackView.addArrangedSubview(tfDOB)
        tfDOB.placeholder = "Date of birth"
        tfDOB.borderStyle = .roundedRect
        tfDOB.setHeight(height: kTfHeightConstant)
        tfDOB.inputView = dobPicker
        let displayDateFormatter = DateFormatter()
        displayDateFormatter.dateFormat = "dd MMM yyyy"
        tfDOB.addToolbar(doneAction: {
            tfDOB.text = displayDateFormatter.string(from: self.dobPicker.date)
        }, cancelAction: nil)
        
        let nextBtn = UIButton()
        view.addSubview(nextBtn)
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -8),
            nextBtn.widthAnchor.constraint(equalToConstant: 70),
            nextBtn.heightAnchor.constraint(equalToConstant: 40),
            nextBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -8)
        ])
        nextBtn.setTitle("Next", for: .normal)
        nextBtn.setTitleFont(font: .helveticaNeueMedium, size: 15)
        nextBtn.layer.cornerRadius = 20
        nextBtn.backgroundColor = .systemBlue
        
        let lineView = UIView()
        view.addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant:1),
            lineView.bottomAnchor.constraint(equalTo: nextBtn.topAnchor,constant: -8)
        ])
        lineView.backgroundColor = .systemGray4
    }
    @objc func backBtnAction(){
        navigationController?.popViewController(animated: true)
    }
}
