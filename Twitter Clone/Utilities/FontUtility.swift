//
//  FontUtility.swift
//  Twitter Clone
//
//  Created by HackinTushar on 18/12/22.
//

import Foundation
import UIKit

enum AppFonts: String{
    case helveticaNeueMedium = "HelveticaNeue-Medium"
    case helveticaNeueBold = "HelveticaNeue-Bold"
}

class FontUtility{
    static let shared = FontUtility()
    
    func getFont(font:AppFonts,size:CGFloat) -> UIFont?{
        return UIFont(name: font.rawValue, size: size)
    }
}
