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
