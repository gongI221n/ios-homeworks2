//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Ivan Chaschin on 25.02.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let identifire = "PostTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(postTitle, postImage, postDescription, postLikes, postViews)
        setupCellConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Cell config
    public func configureCell(title: String, image: String, description: String, likes: Int, views: Int) {
        self.postTitle.text = title
        self.postImage.image = UIImage(named: image)
        self.postDescription.text = description
        self.postLikes.text = "Likes: \(likes)"
        self.postViews.text = "Views: \(views)"
    }
    
    private lazy var postTitle: UILabel = {
        let postTitle = UILabel()
        postTitle.toAutoLayout()
        postTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        postTitle.textColor = .black
        postTitle.numberOfLines = 2
        
        return postTitle
    }()
    
    private lazy var postImage: UIImageView = {
        let postImage = UIImageView()
        postImage.toAutoLayout()
        postImage.backgroundColor = .black
        postImage.contentMode = .scaleAspectFit
        
        return postImage
    }()
    
    private lazy var postDescription: UILabel = {
        let postDescription = UILabel()
        postDescription.toAutoLayout()
        postDescription.textColor = .systemGray
        postDescription.numberOfLines = 0
        postDescription.font = UIFont.systemFont(ofSize: 14)
        
        return postDescription
    }()
    
    private lazy var postLikes: UILabel = {
        let postLikes = UILabel()
        postLikes.toAutoLayout()
        postLikes.textColor = .black
        postLikes.font = UIFont.systemFont(ofSize: 16)
        
        return postLikes
    }()
    
    private lazy var postViews: UILabel = {
        let postViews = UILabel()
        postViews.toAutoLayout()
        postViews.textColor = .black
        postViews.font = UIFont.systemFont(ofSize: 16)
        
        return postViews
    }()
    
    func setupCellConstraints() {
        NSLayoutConstraint.activate([
            
            postTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            postTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            postTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
            
            postImage.topAnchor.constraint(equalTo: postTitle.bottomAnchor, constant: 16),
            postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor),
            
            postDescription.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
            postDescription.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            postDescription.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            
            postLikes.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postLikes.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            postLikes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            postViews.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postViews.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            postViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
        
        
    }
    
}
