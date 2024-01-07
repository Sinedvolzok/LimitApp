//
//  LAButtonCell.swift
//  LimitApp
//
//  Created by Denis Kozlov on 14.12.2023.
//

import UIKit

class LAButtonCell: UICollectionViewCell {
    
    static let identifer = "ButtonCell"
    // MARK: - Variables
    private(set) var inputButton: LAInputButton!
    
    // MARK: - UI Components
    private let titleLaleble:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 40, weight: .medium)
        label.text = "E"
        return label
    }()
    
    // MARK: - Configure
    public func configure(whith inputButton: LAInputButton) {
        self.inputButton = inputButton
        
        self.titleLaleble.text = inputButton.title
        self.backgroundColor = inputButton.color
        self.titleLaleble.textColor = inputButton.labelColor
        setupUI()
    }
    
    private func setupUI() {
        self.addSubview(titleLaleble)
        titleLaleble.translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 24
        NSLayoutConstraint.activate([
            titleLaleble.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLaleble.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLaleble.heightAnchor.constraint(equalTo: heightAnchor),
            titleLaleble.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
}
