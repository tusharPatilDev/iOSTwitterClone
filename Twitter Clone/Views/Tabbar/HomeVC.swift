//
//  HomeVC.swift
//  Twitter Clone
//
//  Created by HackinTushar on 27/02/23.
//

import UIKit

class HomeVC: UIViewController {
    private let followingIndicatorView = UIView()
    private let forYouIndicatorView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    private func initViews(){
        view.backgroundColor = .systemBackground
        let appbar = addNavigationBar()
        appbar.backImg.image = UIImage(systemName: "person")
        appbar.backImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(profileBtnAction)))
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            stackView.topAnchor.constraint(equalTo: appbar.bottomAnchor)
        ])
        
        let forYouView = UIView()
        stackView.addArrangedSubview(forYouView)
        forYouIndicatorView.backgroundColor = .systemBlue
        forYouView.addSubview(forYouIndicatorView)
        forYouIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            forYouIndicatorView.bottomAnchor.constraint(equalTo: forYouView.bottomAnchor),
            forYouIndicatorView.widthAnchor.constraint(equalToConstant: 80),
            forYouIndicatorView.centerXAnchor.constraint(equalTo: forYouView.centerXAnchor),
            forYouIndicatorView.heightAnchor.constraint(equalToConstant: 3)
        ])
        forYouIndicatorView.layer.cornerRadius = 1.5
        
        let forYouLbl = UILabel()
        forYouLbl.text = "For You"
        forYouLbl.font = FontUtility.shared.getFont(font: .helveticaNeueBold, size: 20)
        
        forYouView.addSubview(forYouLbl)
        forYouLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            forYouLbl.leadingAnchor.constraint(equalTo: forYouView.leadingAnchor),
            forYouLbl.centerYAnchor.constraint(equalTo: forYouView.centerYAnchor),
            forYouLbl.trailingAnchor.constraint(equalTo: forYouView.trailingAnchor)
        ])
        forYouLbl.textAlignment = .center
        
        forYouView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(forYouBtnAction)))
        
        
        let followingView = UIView()
        stackView.addArrangedSubview(followingView)
        
        
        followingView.addSubview(followingIndicatorView)
        followingIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followingIndicatorView.bottomAnchor.constraint(equalTo: followingView.bottomAnchor),
            followingIndicatorView.widthAnchor.constraint(equalToConstant: 100),
            followingIndicatorView.centerXAnchor.constraint(equalTo: followingView.centerXAnchor),
            followingIndicatorView.heightAnchor.constraint(equalToConstant: 3)
        ])
        followingIndicatorView.backgroundColor = .systemBackground
        
        followingView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(followingBtnAction)))
        
        let followingLbl = UILabel()
        followingLbl.text = "Following"
        followingLbl.font = FontUtility.shared.getFont(font: .helveticaNeueBold, size: 20)
        followingView.addSubview(followingLbl)
        followingLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followingLbl.leadingAnchor.constraint(equalTo: followingView.leadingAnchor),
            followingLbl.trailingAnchor.constraint(equalTo: followingView.trailingAnchor),
            followingLbl.centerYAnchor.constraint(equalTo: followingView.centerYAnchor)
        ])
        followingLbl.textAlignment = .center
        
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
        tableView.register(TweetTVC.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    @objc private func followingBtnAction(){
        followingIndicatorView.backgroundColor = .systemBlue
        forYouIndicatorView.backgroundColor = .systemBackground
    }
    @objc private func forYouBtnAction(){
        followingIndicatorView.backgroundColor = .systemBackground
        forYouIndicatorView.backgroundColor = .systemBlue
    }
    @objc func profileBtnAction(){
        
    }
}

//MARK: UITableViewDelegate and UITableViewDataSource
extension HomeVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 666
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("indexPath-- \(indexPath.row)")
    }
    
}
