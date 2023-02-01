//
//  ChooseInterestVC.swift
//  Twitter Clone
//
//  Created by HackinTushar on 01/02/23.
//

import UIKit

class ChooseInterestVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        // Do any additional setup after loading the view.
    }
    private func initViews(){
        view.backgroundColor = .systemBackground
        let appBar = addNavigationBar()
        
        let topView = UIView()
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.topAnchor.constraint(equalTo: appBar.bottomAnchor,constant: 8),
            topView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        let titleLbl = UILabel()
        
        topView.addSubview(titleLbl)
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLbl.leadingAnchor.constraint(equalTo: topView.leadingAnchor,constant: 20),
            titleLbl.trailingAnchor.constraint(equalTo: topView.trailingAnchor,constant: -20),
            titleLbl.topAnchor.constraint(equalTo: topView.topAnchor,constant: 0),
        ])
        titleLbl.text = "What do you want to see on Twitter?"
        titleLbl.numberOfLines = 0
        titleLbl.font = FontUtility.shared.getFont(font: .helveticaNeueMedium, size: 26)
        
        let subTitleDescLbl = UILabel()
        topView.addSubview(subTitleDescLbl)
        subTitleDescLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subTitleDescLbl.leadingAnchor.constraint(equalTo: titleLbl.leadingAnchor),
            subTitleDescLbl.trailingAnchor.constraint(equalTo: titleLbl.trailingAnchor),
            subTitleDescLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor,constant: 8),
        ])
        subTitleDescLbl.numberOfLines = 0
        subTitleDescLbl.textColor = .lightGray
        subTitleDescLbl.text = "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile."
        subTitleDescLbl.font = FontUtility.shared.getFont(font: .helveticaNeueMedium, size: 18)
        topView.backgroundColor = .systemBackground
        topView.addBottomBorder(bColor: .systemGroupedBackground,bHeight: 1.5)
        //view.backgroundColor = #colorLiteral(red: 0.9774852635, green: 0.9774852635, blue: 0.9774852635, alpha: 1)
        let middleView = UIView()
        view.addSubview(middleView)
        middleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            middleView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            middleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            middleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            middleView.heightAnchor.constraint(equalToConstant: 8)
        ])
        middleView.backgroundColor = #colorLiteral(red: 0.9774852635, green: 0.9774852635, blue: 0.9774852635, alpha: 1)
        
        
        let bottomView = UIView()
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 60),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
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
        //nextBtn.addTarget(self, action: #selector(nextBtnAction), for: .touchUpInside)
        
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
        
        let collectionViewParentView = UIView()
        view.addSubview(collectionViewParentView)
        collectionViewParentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionViewParentView.topAnchor.constraint(equalTo: middleView.bottomAnchor),
            collectionViewParentView.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
            collectionViewParentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionViewParentView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        let mLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            // make sure that there is a slightly larger gap at the top of each row
        let padding = UIScreen.main.bounds.width*0.05
        mLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            // set a standard item size of 60 * 60
        mLayout.itemSize = CGSize(width: 20, height: 20)
            // the layout scrolls horizontally
        mLayout.scrollDirection = .vertical
        collectionViewParentView.layoutIfNeeded()
        let collectionView = UICollectionView(frame: collectionViewParentView.bounds, collectionViewLayout: mLayout)
        collectionViewParentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: collectionViewParentView.leadingAnchor,constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: collectionViewParentView.trailingAnchor,constant: -5),
            collectionView.topAnchor.constraint(equalTo: collectionViewParentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: collectionViewParentView.bottomAnchor)
        ])
        collectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.reloadData()
    }
}
extension ChooseInterestVC: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let mCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        print("MYCELLL-----")
        mCell.backgroundColor = .red
        return mCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let padding = 5
           let width = (collectionView.frame.size.width - CGFloat(padding) * 2) / CGFloat(2)
        let height:CGFloat = 100 // or what height you want to do
           return CGSize(width: width, height: height)
       }
}
