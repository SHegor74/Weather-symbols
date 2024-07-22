//
//  WeatherCollectionViewCell.swift
//  Weather symbols
//
//  Created by Egor Naberezhnov on 22.07.2024.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    static let reusedId = "WeatherCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textAlignment = .center
        titleLabel.textColor = .systemBlue
        titleLabel.font = .systemFont(ofSize: 24)
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3)
        ])
    }
    
    func configure(with condition: WeatherSymbols) {
        imageView.image = UIImage(systemName: condition.rawValue)
        imageView.tintColor = .systemBlue
        titleLabel.text = condition.localizedName
    }
}
