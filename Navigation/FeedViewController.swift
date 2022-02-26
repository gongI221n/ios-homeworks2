//
//  FeedViewController.swift
//  Navigation
//
//  Created by Ivan Chaschin on 09.02.2022.
//

import UIKit

class FeedViewController: UIViewController {

    
    var postButton = UIButton()
    
    let post = Post(title: "First post")
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.toAutoLayout()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        return stackView
    }()
    
    
    var firstItem: UIButton = {
        let firstItem = UIButton()
        firstItem.toAutoLayout()
        firstItem.setImage(UIImage(named: "Bear"), for: .normal)
        firstItem.addTarget(self, action: #selector(openPost), for: .touchUpInside)
        firstItem.imageView?.contentMode = .scaleAspectFill
        
        return firstItem
    }()
    
    
    var secondItem: UIButton = {
        let secondItem = UIButton()
        secondItem.toAutoLayout()
        secondItem.setImage(UIImage(named: "Boston"), for: .normal)
        secondItem.addTarget(self, action: #selector(openPost), for: .touchUpInside)
        
        return secondItem
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Feed"
        view.addSubview(stackView)
        stackView.addArrangedSubview(firstItem)
        stackView.addArrangedSubview(secondItem)
        setStackViewConstraints()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }

    // Метод для кнопки
    @objc func openPost() {
        let postVC = PostViewController()
        navigationController?.pushViewController(postVC, animated: true)
        postVC.postTitle = post.title
        tabBarController?.tabBar.isHidden = true
    }
    
    private func setStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            stackView.heightAnchor.constraint(equalToConstant: view.bounds.height),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
}
