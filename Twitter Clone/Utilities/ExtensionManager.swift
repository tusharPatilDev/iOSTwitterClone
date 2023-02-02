//
//  ExtensionManager.swift
//  Twitter Clone
//
//  Created by HackinTushar on 18/12/22.
//

import UIKit
fileprivate let kNavigationBarDefaultHeight:CGFloat = 50
extension UIButton{
    func setTitleFont(font:AppFonts,size:CGFloat){
        titleLabel?.font = FontUtility.shared.getFont(font: font, size: size)
    }
    func disableBtn(bColor:UIColor){
        backgroundColor = bColor
        isEnabled = false
    }
    func enableBtn(bColor:UIColor){
        backgroundColor = bColor
        isEnabled = true
    }
}
extension UIView{
    func setHeight(height:CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    func addBottomBorder(bColor:UIColor,bHeight:CGFloat = 1){
        layoutIfNeeded()
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: bHeight)
        bottomLine.backgroundColor = bColor.cgColor
        layer.addSublayer(bottomLine)
    }
    func addTopBorder(bColor:UIColor,bHeight:CGFloat = 1){
        layoutIfNeeded()
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y:1, width: self.frame.size.width, height: bHeight)
        bottomLine.backgroundColor = bColor.cgColor
        layer.addSublayer(bottomLine)
    }
}
extension UITextField{
    
    func addToolbar(doneAction:(() -> Void)? = nil,cancelAction:(() -> Void)? = nil){
        let toolBar = TPKeyboardBar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        
        toolBar.doneBtnAction = {
            doneAction?()
            self.resignFirstResponder()
        }
        
        toolBar.cancelBtnAction = {
            cancelAction?()
            self.resignFirstResponder()
        }
        inputAccessoryView = toolBar
    }
    @objc func doneButtonAction(){
            resignFirstResponder()
    }
    
}
extension UIViewController{
    func addNavigationBar(hideBackBtn:Bool = false) -> NavigationBar{
        let appBar = NavigationBar()
        view.addSubview(appBar)
        appBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            appBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            appBar.heightAnchor.constraint(equalToConstant: kNavigationBarDefaultHeight),
            appBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        appBar.backImg.isHidden = hideBackBtn
        return appBar
    }
}

