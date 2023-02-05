//
//  OTPVerificationVC.swift
//  Twitter Clone
//
//  Created by HackinTushar on 24/12/22.
//

import UIKit

class OTPVerificationVC: UIViewController {
    private let bottomView = UIView()
    var emailOrPhoneNumber = String()
    private var bottomViewBottomConstraint:NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    private func setupViews(){
        view.backgroundColor = .systemBackground
        let appBar = addNavigationBar()
        let weSentCodeLbl = UILabel()
        view.addSubview(weSentCodeLbl)
        weSentCodeLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weSentCodeLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            weSentCodeLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            weSentCodeLbl.topAnchor.constraint(equalTo: appBar.bottomAnchor,constant: 12)
        ])
        weSentCodeLbl.text = "We sent you a code"
        weSentCodeLbl.font = FontUtility.shared.getFont(font: .helveticaNeueBold, size: 30)
        weSentCodeLbl.adjustsFontSizeToFitWidth = true
        weSentCodeLbl.minimumScaleFactor = 0.5
        
        let enterCodeBelowLbl = UILabel()
        view.addSubview(enterCodeBelowLbl)
        enterCodeBelowLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            enterCodeBelowLbl.topAnchor.constraint(equalTo: weSentCodeLbl.bottomAnchor,constant: 10),
            enterCodeBelowLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            enterCodeBelowLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20)
        ])
        enterCodeBelowLbl.numberOfLines = 0
        enterCodeBelowLbl.text = "Enter it below to verify \(emailOrPhoneNumber)"
        enterCodeBelowLbl.font = FontUtility.shared.getFont(font: .helveticaNeueMedium, size: 16)
        enterCodeBelowLbl.textColor = .darkGray
        
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomView.heightAnchor.constraint(equalToConstant: 100),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        bottomViewBottomConstraint =  bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
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
        
        let tfOTP = TPTextField()
        view.addSubview(tfOTP)
        tfOTP.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tfOTP.topAnchor.constraint(equalTo: enterCodeBelowLbl.bottomAnchor,constant: 12),
            tfOTP.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            tfOTP.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            tfOTP.heightAnchor.constraint(equalToConstant: 50)
        ])
        tfOTP.placeholder = " Waiting for SMS to arrive..."
        tfOTP.keyboardType = .numberPad
       
        tfOTP.font = FontUtility.shared.getFont(font: .helveticaNeueBold, size: 16)
        
        let didntRecieveOTPBtn = UIButton()
        view.addSubview(didntRecieveOTPBtn)
        didntRecieveOTPBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            didntRecieveOTPBtn.topAnchor.constraint(equalTo: tfOTP.bottomAnchor,constant: 10),
            didntRecieveOTPBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20)
        ])
        didntRecieveOTPBtn.setTitle("Didn't recieve a text", for: .normal)
        didntRecieveOTPBtn.setTitleFont(font: .helveticaNeueMedium, size: 15)
        didntRecieveOTPBtn.setTitleColor(.systemBlue, for: .normal)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidBecomeInactive(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidBecomeActive(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    @objc func keyboardDidBecomeActive(_ notification: NSNotification){
        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            self.bottomViewBottomConstraint?.constant = -(keyboardHeight - UIDevice.current.safeAreaBottom)
            self.view.layoutIfNeeded()
        }, completion: nil)

    }
    @objc func keyboardDidBecomeInactive(_ notification: NSNotification){
        //let mKey = notification.observationInfo?[UIKeyboardFrameEndUserInfoKey]
        
        UIView.animate(withDuration: 0.5,delay: 0,usingSpringWithDamping: 0.8, initialSpringVelocity: 0) {
            self.bottomViewBottomConstraint?.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    @objc func onNextBtnClicked(){
        let vc = PasswordVerificationVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
