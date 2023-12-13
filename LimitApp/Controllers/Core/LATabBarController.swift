//
//  LATabBarController.swift
//  LimitApp
//
//  Created by Denis Kozlov on 13.12.2023.
//

import UIKit

class LATabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTubs()
    }
    
    private func setTubs() {
        
        let historyNavigation = UINavigationController(
            rootViewController: LAHistoryViewController())
        let inputNavigation = UINavigationController(
            rootViewController: LAInputViewController())
        let settingsNavigation = UINavigationController(
            rootViewController: LASettingsViewController())
        
        historyNavigation.tabBarItem = UITabBarItem(
            title: "History",
            image: UIImage(systemName:"list.bullet.circle"),
            tag: 1)
        inputNavigation.tabBarItem = UITabBarItem(
            title: "Input",
            image: UIImage(systemName:"plus.circle.fill"),
            tag: 2)
        settingsNavigation.tabBarItem = UITabBarItem(
            title: "Settings",
            image: UIImage(systemName:"gearshape"),
            tag: 3)
        
        historyNavigation.navigationBar.prefersLargeTitles = true
        inputNavigation.navigationBar.prefersLargeTitles = true
        settingsNavigation.navigationBar.prefersLargeTitles = true
        
        setViewControllers([
            historyNavigation,
            inputNavigation,
            settingsNavigation
        ], animated: true)
        
        selectedViewController = inputNavigation
    }

}
