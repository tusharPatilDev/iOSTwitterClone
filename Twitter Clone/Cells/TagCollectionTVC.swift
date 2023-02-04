//
//  TagCollectionTVC.swift
//  Twitter Clone
//
//  Created by HackinTushar on 04/02/23.
//

import UIKit

class TagCollectionTVC: UITableViewCell {
    
    private var collectionView:UICollectionView?
    static let cellIdentifier:String = "TagCollectionTVC"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func initViews(){
        selectionStyle = .none
        let mLayout = UICollectionViewFlowLayout()
        mLayout.scrollDirection = .horizontal
        mLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        mLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        mLayout.minimumInteritemSpacing = 0
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: mLayout)
        addSubview(collectionView!)
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView!.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 0),
            collectionView!.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView!.topAnchor.constraint(equalTo: topAnchor),
            collectionView!.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        collectionView?.register(TagCVC.self, forCellWithReuseIdentifier: TagCVC.cellIdentifer)
        collectionView?.isScrollEnabled = true
        collectionView?.delegate = self
        collectionView?.dataSource = self
        userInteractionEnabledWhileDragging = true
    }
}
//MARK: TagCollectionTVC
extension TagCollectionTVC: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCVC.cellIdentifer, for: indexPath) as? TagCVC{
            cell.backgroundColor = .blue
            cell.tagTitle = "MY Tag"
            if indexPath.row%2 == 0{
                cell.tagTitle = "TUshar Patil"
            }
            cell.backgroundColor = .green
            return cell
        }
        return UICollectionViewCell()
    }
    
}
