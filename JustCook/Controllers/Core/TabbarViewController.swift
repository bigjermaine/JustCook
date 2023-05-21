//
//  TabbarViewController.swift
//  JustCook
//
//  Created by Apple on 20/05/2023.
//

import UIKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let Vc1 =  HomeViewController()
        let Vc3 =  SettingsViewController()
        Vc1.navigationItem.largeTitleDisplayMode = .always
        Vc3.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: Vc1)
        let nav3 = UINavigationController(rootViewController: Vc3)
        
        nav1.navigationBar.tintColor = .label
        nav3.navigationBar.tintColor = .label
        
        nav1.tabBarItem = UITabBarItem(title: "Browse", image: UIImage(systemName: "house"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 3)
        
        
        
        nav1.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true
        setViewControllers([nav1,nav3], animated: false)
      
    }
    

    

}
