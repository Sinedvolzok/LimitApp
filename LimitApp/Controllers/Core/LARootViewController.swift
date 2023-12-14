//
//  RootViewController.swift
//  LimitApp
//
//  Created by Denis Kozlov on 30.11.2023.
//

import UIKit

class LARootViewController: UIViewController {
    
    private var current: UIViewController
    
    init() {
        self.current = LAInputViewController()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard #available(iOS 13.0, *) else {fatalError("iOS Version is not supported!")}
        
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            setUpForPad()
        case .phone:
            setUpForPhone()
        default:
            fatalError("Devise is not supported!")
        }
    }
    
    func setUpForPad() {
        print("SetUP iPad")
        addChild(current)
        view.addSubview(current.view)
        current.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            current.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            current.view.topAnchor.constraint(equalTo: view.topAnchor),
            current.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            current.view.widthAnchor.constraint(equalToConstant: view.frame.width/3)
        ])
        current.didMove(toParent: self)
        
        let tabBar = LATabBarController()
        addChild(tabBar)
        view.addSubview(tabBar.view)
        tabBar.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabBar.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.view.trailingAnchor.constraint(equalTo: current.view.leadingAnchor),
            tabBar.view.topAnchor.constraint(equalTo: view.topAnchor),
            tabBar.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tabBar.didMove(toParent: self)
    }
    
    func setUpForPhone() {
        print("SetUP iPhone")
        addChild(current)
        current.view.frame = view.bounds
        view.addSubview(current.view)
        current.didMove(toParent: self)
        
        let tabBar = LATabBarController()
        addChild(tabBar)
        view.addSubview(tabBar.view)
        tabBar.didMove(toParent: self)
    }
    
    func switchToHistory() {
        let new = UINavigationController(rootViewController: LAHistoryViewController())
        addChild(new)
        new.view.frame = view.bounds
        view.addSubview(new.view)
        new.didMove(toParent: self)
        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()
        current = new
    }
    
    func switchToInput() {
        let new = UINavigationController(rootViewController: LAInputViewController())
        addChild(new)
        new.view.frame = view.bounds
        view.addSubview(new.view)
        new.didMove(toParent: self)
        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()
        current = new
    }
    
    func switchToSettings() {
        let new = UINavigationController(rootViewController: LASettingsViewController())
        addChild(new)
        new.view.frame = view.bounds
        view.addSubview(new.view)
        new.didMove(toParent: self)
        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()
        current = new
    }
}

