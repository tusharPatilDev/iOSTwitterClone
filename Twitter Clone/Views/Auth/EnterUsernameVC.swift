//
//  EnterUsernameVC.swift
//  Twitter Clone
//
//  Created by HackinTushar on 31/01/23.
//

import UIKit

class EnterUsernameVC: UIViewController {
    
    private var bottomViewBottomConstraint:NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    private func initViews(){
        view.backgroundColor = .systemBackground
        let appBar = self.addNavigationBar(hideBackBtn: true)
        
        let authTitleLbl = UILabel()
        view.addSubview(authTitleLbl)
        authTitleLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            authTitleLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            authTitleLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            authTitleLbl.topAnchor.constraint(equalTo: appBar.bottomAnchor),
        ])
        authTitleLbl.text = "What should we call you?"
        authTitleLbl.font = FontUtility.shared.getFont(font: .helveticaNeueBold, size: 26)
        
        let usernameDescLbl = UILabel()
        view.addSubview(usernameDescLbl)
        usernameDescLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameDescLbl.leadingAnchor.constraint(equalTo: authTitleLbl.leadingAnchor),
            usernameDescLbl.trailingAnchor.constraint(equalTo: authTitleLbl.trailingAnchor),
            usernameDescLbl.topAnchor.constraint(equalTo: authTitleLbl.bottomAnchor,constant: 8)
        ])
        usernameDescLbl.text = "Your @username is unique. You can always change it later."
        usernameDescLbl.font = FontUtility.shared.getFont(font: .helveticaNeueMedium, size: 18)
        usernameDescLbl.textColor = .systemGray4
        usernameDescLbl.numberOfLines = 0
        
        let tfUsername = TPTextField()
        view.addSubview(tfUsername)
        tfUsername.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tfUsername.leadingAnchor.constraint(equalTo: authTitleLbl.leadingAnchor),
            tfUsername.trailingAnchor.constraint(equalTo: authTitleLbl.trailingAnchor),
            tfUsername.topAnchor.constraint(equalTo: usernameDescLbl.bottomAnchor,constant: 8),
            tfUsername.heightAnchor.constraint(equalToConstant: 50)
        ])
        tfUsername.placeholder = "Username"
        tfUsername.keyboardType = .default
        
        let bottomView = UIView()
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
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            self.bottomViewBottomConstraint?.constant = -(keyboardHeight - 30)
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    @objc func keyboardWillBecomeInactive(){
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            self.bottomViewBottomConstraint?.constant = 0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}
