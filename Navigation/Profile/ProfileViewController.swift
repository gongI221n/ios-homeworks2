//
//  ViewController.swift
//  Navigation
//
//  Created by Ivan Chaschin on 09.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileHeaderView = ProfileHeaderView()
    
    // MARK: Button set title
    var buttonTitle: UIButton = {
        let buttonTitle = UIButton()
        buttonTitle.toAutoLayout()
        buttonTitle.backgroundColor = .systemBlue
        buttonTitle.setTitle("Set title", for: .normal)
        buttonTitle.setTitleColor(.white, for: .normal)
        buttonTitle.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        
        
        return buttonTitle
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Profile"
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        profileHeaderView.addView() // Добавление всех View
        profileHeaderView.SetupConstraints() // Добавление констрейнтов
        profileHeaderView.createToolbar() // Добавление Toolbar
        profileHeaderView.toAutoLayout()
        view.addSubview(buttonTitle)
        setHeaderConstraints()
        
        
    }
    
    func setHeaderConstraints() {
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            profileHeaderView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            buttonTitle.leftAnchor.constraint(equalTo: view.leftAnchor),
            buttonTitle.rightAnchor.constraint(equalTo: view.rightAnchor),
            buttonTitle.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonTitle.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // Метод скрытия клавиатуры по тапу на экран.
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                self.view.endEditing(true)
            }
    
    
    @objc func pressButton() {
        self.title = "New title"
    }
    
}


