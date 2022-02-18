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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Feed"
        view.backgroundColor = .white
        
        //Button
        postButton = UIButton(frame: CGRect(x: view.frame.width/2-100, y: view.frame.height/2-25, width: 200, height: 50))
        postButton.layer.cornerRadius = 10
        postButton.backgroundColor = .systemBlue
        postButton.setTitle("Post", for: .normal)
        
        postButton.addTarget(self, action: #selector(openPost), for: .touchUpInside)

        view.addSubview(postButton)
        
    }

    // Метод для кнопки
    @objc func openPost() {
        let postVC = PostViewController()
        navigationController?.pushViewController(postVC, animated: true)
        postVC.postTitle = post.title
    }
    
    
    
}
