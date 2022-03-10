//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Ivan Chaschin on 10.03.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let identifire = "PhotosCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(photo)
        setupCellConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var photo: UIImageView = {
       let photo = UIImageView()
        photo.toAutoLayout()
//        photo.contentMode = .scaleAspectFit
        photo.contentMode = .scaleToFill
        
        return photo
    }()
    
    private func setupCellConstraints() {
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: contentView.topAnchor),
            photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photo.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            photo.leftAnchor.constraint(equalTo: contentView.leftAnchor)

        ])
    }
    
    func configure(with photoName: String) {
           photo.image = UIImage(named: photoName)
       }
}
