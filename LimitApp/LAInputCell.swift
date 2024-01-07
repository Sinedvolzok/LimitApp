//
//  LAInputCell.swift
//  LimitApp
//
//  Created by Denis Kozlov on 14.12.2023.
//

import UIKit

class LAInputCell: UICollectionReusableView {
       
    static let identifer = "InputCell"
    
    // MARK: - UIComponents
    private let label:UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 72, weight: .heavy)
        label.text = "Error"
        return label
    }()
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(curentInputText: String) {
        self.label.text = curentInputText
    }
    
    // MARK: - UISetup
    private func setupUI() {
        backgroundColor = .systemBackground
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            label.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            label.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
        ])
    }
}
