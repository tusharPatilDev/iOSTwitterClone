//
//  TagCollectionTVC.swift
//  Twitter Clone
//
//  Created by HackinTushar on 04/02/23.
//

import UIKit

protocol TagCollectionDelegate{
    func didSelectItem(items:[String])
}

class TagCollectionTVC: UITableViewCell {
    var delegate:TagCollectionDelegate?
    private var collectionView:DHCollectionView?
    static let cellIdentifier:String = "TagCollectionTVC"
    private var selectedItems:[String] = []
    var tags:[String] = []{
        didSet{
            collectionView?.reloadData()
        }
    }
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
        mLayout.minimumLineSpacing = 0
        mLayout.itemSize = CGSize(width: 0, height: 0)
        collectionView = DHCollectionView(frame: .zero, collectionViewLayout: mLayout)
        contentView.addSubview(collectionView!)
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 0),
            collectionView!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView!.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        collectionView?.register(TagCVC.self, forCellWithReuseIdentifier: TagCVC.cellIdentifer)
        collectionView?.isScrollEnabled = true
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.showsHorizontalScrollIndicator = false
    }
}
//MARK: TagCollectionTVC
extension TagCollectionTVC: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCVC.cellIdentifer, for: indexPath) as? TagCVC{
            cell.tagTitle = tags[indexPath.row]
            if selectedItems.contains(tags[indexPath.row]){
                cell.mainView.backgroundColor = .systemGray6
            } else {
                cell.mainView.backgroundColor = .systemBackground
            }
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedItems.contains(tags[indexPath.row]){
            var index = 0
            for i in selectedItems{
                if i == tags[indexPath.row]{
                    break
                }
                index += 1
            }
            selectedItems.remove(at: index)
        } else {
            selectedItems.append(tags[indexPath.row])
        }
        delegate?.didSelectItem(items: selectedItems)
        collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
