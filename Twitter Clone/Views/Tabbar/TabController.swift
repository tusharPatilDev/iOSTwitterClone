//
//  TabController.swift
//  Twitter Clone
//
//  Created by HackinTushar on 27/02/23.
//

import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    private func initViews(){
        view.backgroundColor = .systemBackground
        viewControllers = [
            createNavController(for: HomeVC(), title: "", image: UIImage(systemName: "house")),
            createNavController(for: SearchVC(), title: "", image: UIImage(systemName: "magnifyingglass")),
            createNavController(for: NotificationVC(), title: "", image: UIImage(systemName: "bell")),
            createNavController(for: MessagesVC(), title: "", image: UIImage(systemName: "message"))
        ]
    }
    fileprivate func createNavController(for rootViewController: UIViewController,
                                                    title: String,
                                                    image: UIImage?) -> UIViewController {
          let navController = UINavigationController(rootViewController: rootViewController)
        navController.setNavigationBarHidden(true, animated: true)
          navController.tabBarItem.title = title
          navController.tabBarItem.image = image
          navController.navigationBar.prefersLargeTitles = true
          rootViewController.navigationItem.title = title
          return navController
      }
    
}
