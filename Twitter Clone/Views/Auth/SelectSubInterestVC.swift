//
//  SelectSubInterestVC.swift
//  Twitter Clone
//
//  Created by HackinTushar on 03/02/23.
//

import UIKit

class SelectSubInterestVC: UIViewController {
    private let tableView = UITableView()
    var selectedInterests:[String] = []
    
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
        subTitleDescLbl.text = "Interests are used to personalize your experience and will be visible on your profile."
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
            middleView.heightAnchor.constraint(equalToConstant: 5)
        ])
        middleView.backgroundColor = #colorLiteral(red: 0.9730937998, green: 0.9730937998, blue: 0.9730937998, alpha: 0.5)
        
        
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
            tableViewParentView.topAnchor.constraint(equalTo: middleView.bottomAnchor),
            tableViewParentView.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
            tableViewParentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableViewParentView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        tableViewParentView.addTopBorder(bColor: .systemGroupedBackground, bHeight: 1.5)
        
        tableViewParentView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: tableViewParentView.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: tableViewParentView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: tableViewParentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: tableViewParentView.trailingAnchor)
        ])
        tableView.register(TagCollectionTVC.self, forCellReuseIdentifier: TagCollectionTVC.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentOffset = CGPoint(x: 0, y: 0)
        tableView.separatorStyle = .none
    }
    
}
//MARK: UITableViewDelegate, UITableViewDataSource
extension SelectSubInterestVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TagCollectionTVC.cellIdentifier) as? TagCollectionTVC{
            cell.tags = ["Premier League","WWE","Esports","Cricket","UEFA Champions League","Manchester United","Basketball","Sports"]
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 25))
            
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: 20)
        label.text = selectedInterests[section]
        label.font = FontUtility.shared.getFont(font: .helveticaNeueBold, size: 16)
        label.textColor = .black
            
        headerView.addSubview(label)
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return selectedInterests.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }
}
