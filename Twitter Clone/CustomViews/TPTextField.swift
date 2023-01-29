//
//  TPTextField.swift
//  Twitter Clone
//
//  Created by HackinTushar on 18/12/22.
//

import UIKit

enum TPTextFieldType{
    case roundCorners
    case rect
}
protocol TPTextFieldDelegate{
    func textFieldDidStartEditing(_ textField:TPTextField)
    func textFieldDidEndEditing(_ textField:TPTextField)
}
class TPTextField: UIView {
    private let textField = UITextField()
    /// True when user wants to enter password
    var isSecureText:Bool = false {
        didSet{
            textField.isSecureTextEntry = isSecureText
        }
    }
    var keyboardType:UIKeyboardType = .default{
        didSet{
            textField.keyboardType = keyboardType
        }
    }
    var delegate:TPTextFieldDelegate?
    
    var placeholder:String = ""{
        didSet{
            textField.placeholder = placeholder
        }
    }
    
    var textFieldType:TPTextFieldType = .roundCorners{
        didSet{
            switch textFieldType {
            case .roundCorners:
                roundAndInactive()
            case .rect:
                rectCornersAndInactive()
            }
        }
    }
    
    var text: String?{
        get{
            return textField.text
        }
        set{
            textField.text = newValue
        }
    }
    
    var pickerView:UIView?{
        didSet{
            textField.inputView = pickerView
        }
    }
    var inputViewHeight:CGFloat{
        get{
            return textField.inputView?.frame.height ?? 0
        }
    }
    var font: UIFont? {
        didSet{
            textField.font = font
        }
    }
    var toolbarView:UIView?{
        didSet{
            textField.inputView = toolbarView
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func roundAndInactive(){
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
    }
    private func rectCornersAndInactive(){
        layer.cornerRadius = 0
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
    }
    private func roundAndActive(){
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemBlue.cgColor
    }
    private func rectCornersAndActive(){
        layer.cornerRadius = 0
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemBlue.cgColor
    }
    private func setupSubviews(){
        roundAndInactive()
        addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor,constant: 5),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -5),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -5)
        ])
        textField.delegate = self
        textField.isSecureTextEntry = false
        textField.keyboardType = keyboardType
    }
}
// MARK: UITextFieldDelegate
extension TPTextField: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        roundAndActive()
        delegate?.textFieldDidStartEditing(self)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        roundAndInactive()
        delegate?.textFieldDidEndEditing(self)
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text == ""{
            delegate?.textFieldDidStartEditing(self)
        }
    }
}
