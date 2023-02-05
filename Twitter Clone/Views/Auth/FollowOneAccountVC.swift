//
//  FollowOneAccountVC.swift
//  Twitter Clone
//
//  Created by HackinTushar on 04/02/23.
//

import UIKit

class FollowOneAccountVC: UIViewController {
    private let nextBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
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
            topView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        let titleLbl = UILabel()
        
        topView.addSubview(titleLbl)
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLbl.leadingAnchor.constraint(equalTo: topView.leadingAnchor,constant: 20),
            titleLbl.trailingAnchor.constraint(equalTo: topView.trailingAnchor,constant: -20),
            titleLbl.topAnchor.constraint(equalTo: topView.topAnchor,constant: 0),
        ])
        titleLbl.text = "Follow 1 or more accounts"
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
        subTitleDescLbl.text = "When you follow someone, you'll see their Tweets in your Timeline. You'll also get more relevant recommendations."
        subTitleDescLbl.font = FontUtility.shared.getFont(font: .helveticaNeueMedium, size: 18)
        topView.backgroundColor = .systemBackground
        
        let bottomView = UIView()
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 60),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
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
        nextBtn.disableBtn(bColor: UIColor.black.withAlphaComponent(0.5))
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
        
        let tableViewParentView = UIView()
        view.addSubview(tableViewParentView)
        tableViewParentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableViewParentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableViewParentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableViewParentView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            tableViewParentView.bottomAnchor.constraint(equalTo: bottomView.topAnchor)
        ])
        let tableView = UITableView()
        tableViewParentView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: tableViewParentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: tableViewParentView.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: tableViewParentView.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: tableViewParentView.bottomAnchor)
        ])
        tableView.register(UserProfileTVC.self, forCellReuseIdentifier: UserProfileTVC.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
}
//MARK: UITableViewDelegate,UITableViewDataSource
extension FollowOneAccountVC: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: UserProfileTVC.cellIdentifier) as? UserProfileTVC{
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let titleLbl = UILabel(frame: CGRect(x: 20, y: 5, width: tableView.frame.width, height: 20))
        titleLbl.font = FontUtility.shared.getFont(font: .helveticaNeueBold, size: 18)
        titleLbl.text = "You may be interested in"
        headerView.addSubview(titleLbl)
        return headerView
    }
}
