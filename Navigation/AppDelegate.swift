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
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // VC
        let feedVC = FeedViewController()
        feedVC.view.backgroundColor = .white
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
        
        let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = UIColor.systemGray5
        
        feedNavigationVC.navigationBar.standardAppearance = appearance
        feedNavigationVC.navigationBar.scrollEdgeAppearance = feedNavigationVC.navigationBar.standardAppearance
        
        profileNavigationVC.navigationBar.standardAppearance = appearance
        profileNavigationVC.navigationBar.scrollEdgeAppearance = profileNavigationVC.navigationBar.standardAppearance

        return true
    }

}

