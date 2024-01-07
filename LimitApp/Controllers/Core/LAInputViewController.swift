//
//  InputViewController.swift
//  LimitApp
//
//  Created by Denis Kozlov on 13.12.2023.
//

import UIKit

class LAInputViewController: UIViewController {
    
    // MARK: - Variables
    let viewModel:LAInputViewModel
    
    // MARK: - UI Compponents
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(LAInputCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: LAInputCell.identifer)
        collectionView.register(LAButtonCell.self, forCellWithReuseIdentifier: LAButtonCell.identifer)
        return collectionView
    }()
    
    // MARK: - Lifecycle
    init(_ viewModel: LAInputViewModel = LAInputViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16),
            collectionView.topAnchor.constraint(equalTo: guide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ])
    }
}
// MARK: - CollectionView Methods
extension LAInputViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Section Header Cell
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: LAInputCell.identifer, for: indexPath) as? LAInputCell else {
            fatalError("Fail to dequeue LAInputCell in LAInputViewController.")
        }
        header.configure(curentInputText: viewModel.inputHeader)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let totalCellHeigth = view.frame.size.width
        let totalVerticalCellSpacing = CGFloat(50*4)
        let avalibleScreenHeigth = view.frame.size.height
        let headerHeigth = avalibleScreenHeigth - totalCellHeigth - totalVerticalCellSpacing
        
        return CGSize(width: view.frame.size.width, height: headerHeigth)
    }
    
    // MARK: - Regular Cells Buttons
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.inputButtonCells.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LAButtonCell.identifer, for: indexPath) as? LAButtonCell else {
            fatalError("Fail to dequeue LAButtton in LAInputViewController")
        }
        let inputButton = self.viewModel.inputButtonCells[indexPath.row]
        
        cell.configure(whith: inputButton)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let inputButton = self.viewModel.inputButtonCells[indexPath.row]
        
        switch inputButton {
        case let .number(int) where int == 0:
            return CGSize(width: (view.frame.width/5)*2 + (view.frame.width/5)/6,
                          height: view.frame.width/5)
        default:
            return CGSize(width: view.frame.width/5, height: view.frame.width/5)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return (self.view.frame.width/5)/6
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let buttonCell = self.viewModel.inputButtonCells[indexPath.row]
        
        print(buttonCell.title)
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}
