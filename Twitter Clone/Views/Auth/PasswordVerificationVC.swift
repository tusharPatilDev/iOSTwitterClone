//
//  PasswordVerificationVC.swift
//  Twitter Clone
//
//  Created by HackinTushar on 29/01/23.
//

import UIKit

class PasswordVerificationVC: UIViewController {
    private let bottomView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    private func setupViews(){
        view.backgroundColor = .systemBackground
        let appBar = NavigationBar()
        view.addSubview(appBar)
        appBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            appBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            appBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            appBar.heightAnchor.constraint(equalToConstant: 40)
        ])
        appBar.backImg.isHidden = true
        
        let youNeedPasswordTitleLbl = UILabel()
        view.addSubview(youNeedPasswordTitleLbl)
        youNeedPasswordTitleLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            youNeedPasswordTitleLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 12),
            youNeedPasswordTitleLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -12),
            youNeedPasswordTitleLbl.topAnchor.constraint(equalTo: appBar.bottomAnchor,constant: 12),
        ])
        youNeedPasswordTitleLbl.text = "You'll need a password"
        youNeedPasswordTitleLbl.font = FontUtility.shared.getFont(font: .helveticaNeueMedium, size: 30)
        youNeedPasswordTitleLbl.minimumScaleFactor = 8
        let passwordTypeLbl = UILabel()
        view.addSubview(passwordTypeLbl)
        passwordTypeLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTypeLbl.topAnchor.constraint(equalTo: youNeedPasswordTitleLbl.bottomAnchor,constant: 8),
            passwordTypeLbl.leadingAnchor.constraint(equalTo: youNeedPasswordTitleLbl.leadingAnchor),
            passwordTypeLbl.trailingAnchor.constraint(equalTo: youNeedPasswordTitleLbl.trailingAnchor)
        ])
        passwordTypeLbl.text = "Make sure it's 8 characters or more."
        passwordTypeLbl.font = FontUtility.shared.getFont(font: .helveticaNeueMedium, size: 18)
        passwordTypeLbl.textColor = .systemGray4
        
        let tfPassword = TPTextField()
        tfPassword.placeholder = "Password"
        view.addSubview(tfPassword)
        tfPassword.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tfPassword.leadingAnchor.constraint(equalTo: youNeedPasswordTitleLbl.leadingAnchor),
            tfPassword.trailingAnchor.constraint(equalTo: youNeedPasswordTitleLbl.trailingAnchor),
            tfPassword.heightAnchor.constraint(equalToConstant: 50),
            tfPassword.topAnchor.constraint(equalTo: passwordTypeLbl.bottomAnchor,constant: 12)
        ])
        tfPassword.isSecureText = true
        
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 100),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
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
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBecomeInactive), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBecomeActive(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    @objc func keyboardWillBecomeActive(_ notification:NSNotification){
        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            self.bottomView.frame.origin.y = self.view.frame.height - (keyboardHeight + 100)
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    @objc func keyboardWillBecomeInactive(){
        print("keyboardWillBecomeInactive-----")
        UIView.animate(withDuration: 0.5,delay: 0,usingSpringWithDamping: 0.8, initialSpringVelocity: 0) {
            self.bottomView.frame.origin.y = self.view.safeAreaLayoutGuide.layoutFrame.height
            self.view.layoutIfNeeded()
        }
    }
    @objc func onNextBtnClicked(){
        let vc = PickProfileVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

