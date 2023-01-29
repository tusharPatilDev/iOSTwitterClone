//
//  ExtensionManager.swift
//  Twitter Clone
//
//  Created by HackinTushar on 18/12/22.
//

import UIKit

extension UIButton{
    func setTitleFont(font:AppFonts,size:CGFloat){
        titleLabel?.font = FontUtility.shared.getFont(font: font, size: size)
    }
}
extension UIView{
    func setHeight(height:CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
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


