//
//  AddTweetVC.swift
//  Twitter Clone
//
//  Created by HackinTushar on 02/03/23.
//

import UIKit

class AddTweetVC: UIViewController {
    
    private let navigationView = UIView()
    private let tweetBtn = UIButton()
    private var bottomViewBottomConstraint:NSLayoutConstraint?
    private let tweetTV = UITextView()
    private let bottomView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    private func setupViews(){
        view.backgroundColor = .systemBackground
        addUpperView()
        setupBottomView()
        setupTweetTxtView()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBecomeInactive), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBecomeActive(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    private func addUpperView(){
        view.addSubview(navigationView)
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            navigationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let closeBtn = UIButton()
        view.addSubview(closeBtn)
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeBtn.heightAnchor.constraint(equalToConstant: 30),
            closeBtn.widthAnchor.constraint(equalToConstant: 30),
            closeBtn.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor,constant: 16),
            closeBtn.centerYAnchor.constraint(equalTo: navigationView.centerYAnchor)
        ])
        closeBtn.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeBtn.tintColor = .darkGray
        closeBtn.addTarget(self, action: #selector(closeBtnActin), for: .touchUpInside)
        
        navigationView.addSubview(tweetBtn)
        tweetBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tweetBtn.centerYAnchor.constraint(equalTo: navigationView.centerYAnchor),
            tweetBtn.trailingAnchor.constraint(equalTo: navigationView.trailingAnchor,constant: -16),
            tweetBtn.heightAnchor.constraint(equalToConstant: 30),
            tweetBtn.widthAnchor.constraint(equalToConstant: 80)
        ])
        tweetBtn.backgroundColor = .systemBlue
        tweetBtn.setTitleColor(.white, for: .normal)
        tweetBtn.setTitle("Tweet", for: .normal)
        tweetBtn.setTitleFont(font: .helveticaNeueMedium, size: 16)
        tweetBtn.layer.cornerRadius = 15
    }
    private func setupTweetTxtView(){
        tweetTV.delegate = self
        view.addSubview(tweetTV)
        tweetTV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tweetTV.topAnchor.constraint(equalTo: navigationView.bottomAnchor,constant: 16),
            tweetTV.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
            tweetTV.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            tweetTV.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16)
        ])
        tweetTV.text = "What's happening?"
        tweetTV.textColor = .lightGray
        tweetTV.font = FontUtility.shared.getFont(font: .helveticaNeueBold, size: 20)
    }
    private func setupBottomView(){
        bottomView.backgroundColor = .red
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 50)
        ])
        bottomViewBottomConstraint = bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        bottomViewBottomConstraint?.isActive = true
    }
    @objc private func closeBtnActin(){
        navigationController?.popViewController(animated: true)
    }
    //MARK: Keyboard functions
    @objc func keyboardWillBecomeActive(_ notification:NSNotification){
        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            self.bottomViewBottomConstraint?.constant = -(keyboardHeight - UIDevice.current.safeAreaBottom)
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
//MARK: UITextViewDelegate
extension AddTweetVC: UITextViewDelegate{
    func textViewDidChangeSelection(_ textView: UITextView) {
        if textView.textColor == .black && textView.text == ""{
            textView.text = "What's happening?"
            textView.textColor = .lightGray
        } else if textView.textColor == .lightGray && textView.text != ""{
            textView.textColor = .black
        } 
    }
}
