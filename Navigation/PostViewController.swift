//
//  PostViewController.swift
//  Navigation
//
//  Created by Ivan Chaschin on 09.02.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var postTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = postTitle
        view.backgroundColor = .systemTeal
        
        // Кнопка Инфо для перехода на infoVC
        let infoBarItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(openInfo))
        
        navigationItem.rightBarButtonItem = infoBarItem
    }
    
    @objc func openInfo() {
        let infoVC = InfoViewController()
        navigationController?.present(infoVC, animated: true)

    }
}

