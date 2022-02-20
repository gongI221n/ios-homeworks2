//
//  ViewController.swift
//  Navigation
//
//  Created by Ivan Chaschin on 09.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileHeaderView = ProfileHeaderView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Profile"
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        profileHeaderView.addView() // Добавление всех View
        profileHeaderView.SetupConstraints() // Добавление констрейнтов
        profileHeaderView.createToolbar() // Добавление Toolbar
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            profileHeaderView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // Метод скрытия клавиатуры по тапу на экран.
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                self.view.endEditing(true)
            }
    
    
}

