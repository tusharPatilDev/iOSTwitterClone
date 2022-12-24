//
//  OTPVerificationVC.swift
//  Twitter Clone
//
//  Created by HackinTushar on 24/12/22.
//

import UIKit

class OTPVerificationVC: UIViewController {
    
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
            appBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            appBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            appBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            appBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        appBar.backImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onBackBtnClicked)))
        let weSentCodeLbl = UILabel()
        view.addSubview(weSentCodeLbl)
        weSentCodeLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weSentCodeLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            weSentCodeLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            weSentCodeLbl.topAnchor.constraint(equalTo: appBar.bottomAnchor,constant: 12)
        ])
        weSentCodeLbl.text = "We sent you a code"
        weSentCodeLbl.font = FontUtility.shared.getFont(font: .helveticaNeueBold, size: 28)
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
        enterCodeBelowLbl.text = "Enter it below to verify +91 942129371391"
        enterCodeBelowLbl.font = FontUtility.shared.getFont(font: .helveticaNeueMedium, size: 16)
        enterCodeBelowLbl.textColor = .darkGray
        
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
        nextBtn.backgroundColor = .black
        nextBtn.addTarget(self, action: #selector(onNextBtnClicked), for: .touchUpInside)
        
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
        
        let tfOTP = UITextField()
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
        tfOTP.borderStyle = .roundedRect
        tfOTP.font = FontUtility.shared.getFont(font: .helveticaNeueBold, size: 16)
//        tfOTP.layer.borderColor = UIColor.systemBlue.cgColor
//        tfOTP.layer.borderWidth = 1.5
//        tfOTP.layer.cornerRadius = 8
        tfOTP.addToolbar()
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
    }
    @objc func onNextBtnClicked(){
        
    }
    @objc func onBackBtnClicked(){
        navigationController?.popViewController(animated: true)
    }
}
