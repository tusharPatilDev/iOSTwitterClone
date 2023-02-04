//
//  DHCollectionView.swift
//  Twitter Clone
//
//  Created by HackinTushar on 04/02/23.
//

import UIKit

class DHCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if bounds.size != intrinsicContentSize {
            self.invalidateIntrinsicContentSize()
        }
    }
    override var intrinsicContentSize: CGSize {
        return collectionViewLayout.collectionViewContentSize
    }
}
