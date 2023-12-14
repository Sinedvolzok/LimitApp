//
//  InputViewController.swift
//  LimitApp
//
//  Created by Denis Kozlov on 13.12.2023.
//

import UIKit

class LAInputViewController: UIViewController {
    
    // MARK: UI Compponents
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(LAInputCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: LAInputCell.identifer)
        collectionView.register(LAButtonCell.self, forCellWithReuseIdentifier: LAButtonCell.identifer)
        return collectionView
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }
    
    // MARK: UI Setup
    private func setupUI() {
        
    }
}
