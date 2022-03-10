//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Ivan Chaschin on 07.03.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    static let identifire = "PhotosTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.toAutoLayout()
        self.selectionStyle = .none
        
        contentView.addSubviews(photosLabel, arrowImage, previewStackView)
        previewStackView.addArrangedSubview(previewImage1)
        previewStackView.addArrangedSubview(previewImage2)
        previewStackView.addArrangedSubview(previewImage3)
        previewStackView.addArrangedSubview(previewImage4)
        
        setupConstraint()
        
    }
    
    // MARK: Label
    private lazy var photosLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Photos"
        
        return label
    }()
    
    // MARK: Arrow
    private lazy var arrowImage: UIImageView = {
        let arrowImage = UIImageView()
        arrowImage.image = UIImage(systemName: "arrow.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))?.withTintColor(.black, renderingMode: .alwaysOriginal)
        arrowImage.toAutoLayout()
        
        return arrowImage
    }()
    
    // MARK: PreviewStackView
    private lazy var previewStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.toAutoLayout()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 8
        
        return stackView
    }()
    
    // MARK: Preview Image 1
    private lazy var previewImage1: UIImageView = {
       let image1 = UIImageView()
        image1.image = UIImage(named: photoArray[0])
        image1.layer.cornerRadius = 6
        image1.clipsToBounds = true
        image1.toAutoLayout()
        
        return image1
    }()
    
    // MARK: Preview Image 2
    private lazy var previewImage2: UIImageView = {
       let image2 = UIImageView()
        image2.image = UIImage(named: photoArray[1])
        image2.layer.cornerRadius = 6
        image2.clipsToBounds = true
        image2.toAutoLayout()
        
        return image2
    }()
    
    // MARK: Preview Image 3
    private lazy var previewImage3: UIImageView = {
       let image3 = UIImageView()
        image3.image = UIImage(named: photoArray[2])
        image3.layer.cornerRadius = 6
        image3.clipsToBounds = true
        image3.toAutoLayout()
        
        return image3
    }()
    
    // MARK: Preview Image 4
    private lazy var previewImage4: UIImageView = {
       let image4 = UIImageView()
        image4.image = UIImage(named: photoArray[3])
        image4.layer.cornerRadius = 6
        image4.clipsToBounds = true
        image4.toAutoLayout()
        
        return image4
    }()
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
        
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            
            arrowImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
            arrowImage.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            arrowImage.heightAnchor.constraint(equalToConstant: 40),
            arrowImage.widthAnchor.constraint(equalToConstant: 40),
            
            previewStackView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            previewStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            previewStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
            previewStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            previewImage1.widthAnchor.constraint(equalToConstant: (contentView.frame.width - 16) / 4),
            previewImage1.heightAnchor.constraint(equalTo: previewImage1.widthAnchor),
            
            previewImage2.widthAnchor.constraint(equalToConstant: (contentView.frame.width - 16) / 4),
            previewImage2.heightAnchor.constraint(equalTo: previewImage2.widthAnchor),
            
            previewImage3.widthAnchor.constraint(equalToConstant: (contentView.frame.width - 16) / 4),
            previewImage3.heightAnchor.constraint(equalTo: previewImage2.widthAnchor),
            
            previewImage4.widthAnchor.constraint(equalToConstant: (contentView.frame.width - 16) / 4),
            previewImage4.heightAnchor.constraint(equalTo: previewImage2.widthAnchor),
            
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
