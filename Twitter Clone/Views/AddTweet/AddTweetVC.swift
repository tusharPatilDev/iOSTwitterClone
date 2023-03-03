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
    private let progressView = CircularProgressView()
    
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
        tweetTV.autocorrectionType = .no
        tweetTV.text = "What's happening?"
        tweetTV.textColor = .lightGray
        tweetTV.font = FontUtility.shared.getFont(font: .helveticaNeueBold, size: 20)
    }
    private func setupBottomView(){
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 50)
        ])
        bottomViewBottomConstraint = bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        bottomViewBottomConstraint?.isActive = true
        
        bottomView.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            progressView.heightAnchor.constraint(equalToConstant: 40),
            progressView.widthAnchor.constraint(equalToConstant: 40),
            progressView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 16),
            progressView.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor)
        ])
        let borderView = UIView()
        borderView.backgroundColor = .systemGray4
        progressView.addSubview(borderView)
        borderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            borderView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            borderView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
            borderView.heightAnchor.constraint(equalToConstant: 0.5),
            borderView.topAnchor.constraint(equalTo: bottomView.topAnchor)
        ])
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
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "What's happening?"{
            textView.textColor = .black
            textView.text = ""
        } else {
            textView.textColor = .black
        }
    }
    func textViewDidChangeSelection(_ textView: UITextView) {
        if textView.text == "What's happening?" || textView.text == ""{
            tweetBtn.isUserInteractionEnabled = false
            tweetBtn.backgroundColor = .systemBlue.withAlphaComponent(0.5)
            progressView.setProgress(progress: 0.0)
        } else if textView.text != ""{
            let progress:Double = Double(Double(textView.text.count) / 200.0)
            print("progress--- \(progress)")
            progressView.setProgress(progress: progress)
            tweetBtn.isUserInteractionEnabled = true
            tweetBtn.backgroundColor = .systemBlue
        }
        
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // get the current text, or use an empty string if that failed
        let currentText = textView.text ?? ""

        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }

        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: text)

        // make sure the result is under 16 characters
        return updatedText.count <= 200
    }
}
