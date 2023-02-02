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
    private let stackView = UIStackView()
    private let bottomView = UIView()
    private let tfDOB = TPTextField()
    private let tfName = TPTextField()
    private let tfEmail = TPTextField()
    private let useEmailInsteadBtn = UIButton()
    private var bottomViewBottomConstraint:NSLayoutConstraint?
    private var stackViewCenterYConstraint:NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
    }
    private func setupViews(){
        tfDOB.delegate = self
        tfEmail.delegate = self
        tfName.delegate = self
        
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
        createAccountLbl.font = FontUtility.shared.getFont(font: .helveticaNeueBold, size: 30)
        createAccountLbl.textColor = .black
        
        stackView.spacing = 12
        stackView.axis = .vertical
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30)
        ])
        stackViewCenterYConstraint = stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        stackViewCenterYConstraint?.isActive = true
        
        stackView.addArrangedSubview(tfName)
        tfName.placeholder = "Name"
        tfName.setHeight(height: kTfHeightConstant)
//        tfName.borderStyle = .roundedRect
        
        stackView.addArrangedSubview(tfEmail)
        tfEmail.setHeight(height: kTfHeightConstant)
        tfEmail.placeholder = "Email address"
        
        
        
        dobPicker.preferredDatePickerStyle = .wheels
        dobPicker.datePickerMode = .date
        
        stackView.addArrangedSubview(tfDOB)
        tfDOB.placeholder = "Date of birth"
        tfDOB.setHeight(height: kTfHeightConstant)
        tfDOB.pickerView = dobPicker
        let displayDateFormatter = DateFormatter()
        displayDateFormatter.dateFormat = "dd MMM yyyy"
//        tfDOB.addToolbar(doneAction: {
//            tfDOB.text = displayDateFormatter.string(from: self.dobPicker.date)
//        }, cancelAction: nil)
        
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomView.heightAnchor.constraint(equalToConstant: 100),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        bottomViewBottomConstraint = bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        bottomViewBottomConstraint?.isActive = true
        
        let nextBtn = UIButton()
        bottomView.addSubview(nextBtn)
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextBtn.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor,constant: -8),
            nextBtn.widthAnchor.constraint(equalToConstant: 70),
            nextBtn.heightAnchor.constraint(equalToConstant: 40),
            nextBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -8)
        ])
        nextBtn.setTitle("Next", for: .normal)
        nextBtn.setTitleFont(font: .helveticaNeueMedium, size: 15)
        nextBtn.layer.cornerRadius = 20
        nextBtn.backgroundColor = .black
        nextBtn.addTarget(self, action: #selector(onNextBtnClicked), for: .touchUpInside)
        
        
        let lineView = UIView()
        bottomView.addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant:1),
            lineView.bottomAnchor.constraint(equalTo: nextBtn.topAnchor,constant: -8)
        ])
        lineView.backgroundColor = .systemGray4
        
        bottomView.addSubview(useEmailInsteadBtn)
        useEmailInsteadBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            useEmailInsteadBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8),
            useEmailInsteadBtn.heightAnchor.constraint(equalToConstant: 40),
            useEmailInsteadBtn.topAnchor.constraint(equalTo: nextBtn.topAnchor)
        ])
        useEmailInsteadBtn.layer.borderColor = UIColor.darkGray.cgColor
        useEmailInsteadBtn.layer.borderWidth = 1
        useEmailInsteadBtn.setTitleFont(font: .helveticaNeueBold, size: 15)
        useEmailInsteadBtn.setTitle("  Use email instead  ", for: .normal)
        useEmailInsteadBtn.setTitleColor(.black, for: .normal)
        useEmailInsteadBtn.layer.cornerRadius = 20
        useEmailInsteadBtn.addTarget(self, action: #selector(useEmailInsteadBtnAction), for: .touchUpInside)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBecomeActive(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidBecomeInactive), name: UIResponder.keyboardWillHideNotification, object: nil)
        tfEmail.keyboardType = .emailAddress
        useEmailInsteadBtn.tag = 1
    }

    @objc func keyboardWillBecomeActive(_ notification:NSNotification){
        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            self.stackViewCenterYConstraint?.constant = -keyboardHeight/2
            self.bottomViewBottomConstraint?.constant = -(keyboardHeight - 30)
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    @objc func keyboardDidBecomeInactive(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            self.stackViewCenterYConstraint?.constant = 0
            self.bottomViewBottomConstraint?.constant = 0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    @objc func useEmailInsteadBtnAction(){
        if useEmailInsteadBtn.tag == 1{
            useEmailInsteadBtn.tag = 0
        } else {
            useEmailInsteadBtn.tag = 1
        }
    }
    @objc func onNextBtnClicked(){
        let vc = OTPVerificationVC()
        vc.emailOrPhoneNumber = tfEmail.text ?? ""
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func backBtnAction(){
        navigationController?.popViewController(animated: true)
    }
}
extension CreateAccountVC: TPTextFieldDelegate{
    func textFieldDidEndEditing(_ textField: TPTextField) {
        
    }
    

    func textFieldDidStartEditing(_ textField: TPTextField) {
        switch textField{
        case tfDOB:
            let inputViewHeight = textField.inputViewHeight + 100
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                self.stackViewCenterYConstraint?.constant = -80
                //self.bottomView.frame.origin.y = self.view.frame.height-(textField.inputView?.frame.height ?? 0)
                self.bottomViewBottomConstraint?.constant = -(textField.inputViewHeight)
                self.view.layoutIfNeeded()
            }, completion: nil)
            useEmailInsteadBtn.isHidden = true
        case tfEmail:
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
//                self.stackViewCenterYConstraint?.constant = -80
//                self.bottomView.frame.origin.y = (self.view.frame.height/2) - 30
//                self.view.layoutIfNeeded()
//            }, completion: nil)
            useEmailInsteadBtn.isHidden = false
        case tfName:
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
//                self.stackViewCenterYConstraint?.constant = -80
//                self.bottomView.frame.origin.y = (self.view.frame.height/2) - 30
//                self.view.layoutIfNeeded()
//            }) { _ in
//                self.view.layoutIfNeeded()
//            }
            useEmailInsteadBtn.isHidden = true
        default:
            print("something went wrong")
        }
    }
    
}

