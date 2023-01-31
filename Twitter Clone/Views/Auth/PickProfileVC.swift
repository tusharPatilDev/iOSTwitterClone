//
//  PickProfileVC.swift
//  Twitter Clone
//
//  Created by HackinTushar on 30/01/23.
//

import UIKit
import UniformTypeIdentifiers

class PickProfileVC: UIViewController {
    
    private let bottomView = UIView()
    private let appBar = NavigationBar()
    private let cameraImg = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        initViews()
    }
    private func initViews(){
        
        view.addSubview(appBar)
        appBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            appBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            appBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            appBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        appBar.backImg.isHidden = true
        setupBottomViews()
    }
    private func setupBottomViews(){
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 100)
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
        
        let skipForNowBtn = UIButton()
        bottomView.addSubview(skipForNowBtn)
        skipForNowBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skipForNowBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8),
            skipForNowBtn.heightAnchor.constraint(equalToConstant: 40),
            skipForNowBtn.topAnchor.constraint(equalTo: nextBtn.topAnchor)
        ])
        skipForNowBtn.layer.borderColor = UIColor.darkGray.cgColor
        skipForNowBtn.layer.borderWidth = 1
        skipForNowBtn.setTitleFont(font: .helveticaNeueBold, size: 15)
        skipForNowBtn.setTitle("  Skip for now  ", for: .normal)
        skipForNowBtn.setTitleColor(.black, for: .normal)
        skipForNowBtn.layer.cornerRadius = 20
        skipForNowBtn.addTarget(self, action: #selector(skipForNowAction), for: .touchUpInside)
        
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
        
        let pickProfileLbl = UILabel()
        view.addSubview(pickProfileLbl)
        pickProfileLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pickProfileLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            pickProfileLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            pickProfileLbl.topAnchor.constraint(equalTo: appBar.bottomAnchor,constant: 12)
        ])
        pickProfileLbl.text = "Pick a profile picture"
        pickProfileLbl.font = FontUtility.shared.getFont(font: .helveticaNeueMedium, size: 30)
        pickProfileLbl.minimumScaleFactor = 8
        
        let uploadItLbl = UILabel()
        view.addSubview(uploadItLbl)
        uploadItLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            uploadItLbl.topAnchor.constraint(equalTo: pickProfileLbl.bottomAnchor,constant: 10),
            uploadItLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            uploadItLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20)
        ])
        uploadItLbl.numberOfLines = 0
        uploadItLbl.text = "Have a favorite selfie? Upload it now."
        uploadItLbl.font = FontUtility.shared.getFont(font: .helveticaNeueMedium, size: 16)
        uploadItLbl.textColor = .darkGray
        
//        let uploadView = UIView()
//        view.addSubview(uploadView)
//        uploadView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            uploadView.widthAnchor.constraint(equalToConstant: 200),
//            uploadView.heightAnchor.constraint(equalToConstant: 200),
//            uploadView.topAnchor.constraint(equalTo: uploadItLbl.bottomAnchor,constant: 40),
//            uploadView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
//        uploadView.layer.borderColor = UIColor.systemBlue.cgColor
//        uploadView.layer.borderWidth = 1
        
        view.addSubview(cameraImg)
        cameraImg.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cameraImg.widthAnchor.constraint(equalToConstant: 200),
            cameraImg.heightAnchor.constraint(equalToConstant: 200),
            cameraImg.topAnchor.constraint(equalTo: uploadItLbl.bottomAnchor,constant: 40),
            cameraImg.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        cameraImg.image = UIImage(systemName: "camera")
        cameraImg.contentMode = .scaleAspectFit
        cameraImg.isUserInteractionEnabled = true
        cameraImg.layer.cornerRadius = 100
        cameraImg.layer.borderColor = UIColor.systemBlue.cgColor
        cameraImg.layer.borderWidth = 1
        cameraImg.clipsToBounds = true
        cameraImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(uploadAction)))
    }
    @objc func uploadAction(){
        print("uploadAction")
        let vc = UIImagePickerController()
        vc.mediaTypes = [UTType.image.identifier]
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
    @objc func skipForNowAction(){
        let vc = EnterUsernameVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
//MARK: UINavigationControllerDelegate, UIImagePickerDelegate
extension PickProfileVC: UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let tempImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        cameraImg.image = tempImage
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
