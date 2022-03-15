//
//  ViewController.swift
//  Navigation
//
//  Created by Ivan Chaschin on 09.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileHeaderView = ProfileHeaderView()
    var logInVC = LogInViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Profile"
        view.backgroundColor = .white
        view.addSubview(ProfileViewController.postTableView)
        ProfileViewController.postTableView.dataSource = self
        ProfileViewController.postTableView.delegate = self
        ProfileViewController.postTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifire)
        ProfileViewController.postTableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileHeaderView.identifire)
        ProfileViewController.postTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifire)
        setupConstraints()
//        navigationController?.pushViewController(logInVC, animated: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.tabBar.isHidden = false
    }
    
//    public lazy var view1: UIView = {
//       let view = UIView()
//        view.toAutoLayout()
//        view.alpha = 0
//        view.backgroundColor = .systemGray
//
//        return view
//    }()
    
    static var postTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.toAutoLayout()
        tableView.isScrollEnabled = true
        tableView.separatorInset = .zero
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 220
        return tableView
    }()
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            ProfileViewController.postTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ProfileViewController.postTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ProfileViewController.postTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            ProfileViewController.postTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
//            view1.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
//            view1.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
//            view1.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
//            view1.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),

        ])
        
    }
    
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 1 {
                   return posts.count
               } else {
                   return 1
               }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 1 {
            let cell = ProfileViewController.postTableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifire, for: indexPath) as! PostTableViewCell
            cell.configureCell(title: posts[indexPath.row].title,
                               image: posts[indexPath.row].image,
                               description: posts[indexPath.row].description,
                               likes: posts[indexPath.row].likes,
                               views: posts[indexPath.row].views)
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: PhotosTableViewCell.identifire,
                for: indexPath) as! PhotosTableViewCell
            return cell
        }
        
    }
        
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.identifire) as! ProfileHeaderView
            return header
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 220
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let photosVC = PhotosViewController()
            navigationController?.pushViewController(photosVC, animated: true)
        }
    }
    
}
