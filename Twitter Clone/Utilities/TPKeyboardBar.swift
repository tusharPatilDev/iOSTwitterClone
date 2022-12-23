//
//  TPKeyboardBar.swift
//  Twitter Clone
//
//  Created by HackinTushar on 23/12/22.
//

import UIKit

class TPKeyboardBar: UIToolbar {
    var doneBtnAction:(() -> Void)? = nil
    var cancelBtnAction:(() -> Void)? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

        let cancel: UIBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let mItems = [done,flexSpace, cancel]
        self.items = mItems
        sizeToFit()
    }
    @objc private func doneButtonAction(){
        doneBtnAction?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
