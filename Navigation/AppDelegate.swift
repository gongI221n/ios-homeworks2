//
//  AppDelegate.swift
//  Navigation
//
//  Created by Ivan Chaschin on 09.02.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        // VC
        let feedVC = FeedViewController()
        let ProfileVC = ProfileViewController()
        let postVC = PostViewController()
        
        
        //Navigation VC
        let feedNavigationVC = UINavigationController(rootViewController: feedVC)
        let profileNavigationVC = UINavigationController(rootViewController: ProfileVC)
        

        // Создаю tabBar
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [feedNavigationVC, profileNavigationVC] // Помещаю в tabBar VC
//        tabBarController.selectedIndex = 0
        
        
        // Иконки и текст TabBarItems для NavigationVC
        profileNavigationVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 0)
        feedNavigationVC.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "note.text"), tag: 0)
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()

        return true
    }

}

