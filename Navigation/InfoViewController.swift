//
//  InfoViewController.swift
//  Navigation
//
//  Created by Ivan Chaschin on 15.02.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    var alertButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
        
        //Alert
        alertButton = UIButton(frame: CGRect(x: view.frame.width/2-100, y: view.frame.height/2-25, width: 200, height: 50))
        alertButton.layer.cornerRadius = 10
        alertButton.backgroundColor = .systemBlue
        alertButton.setTitle("Alert", for: .normal)
        
        alertButton.addTarget(self, action: #selector(openAlert), for: .touchUpInside)
        
        view.addSubview(alertButton)
        
        
    }
    
    @objc func openAlert() {
        
        let alert = UIAlertController(title: "Alert Title", message: "Alert Message", preferredStyle: .alert)
        let firstAlertAction = UIAlertAction(title: "1st Alert Action", style: .default) { _ in
            print("1st Alert Action")
        }
        let secondAlertAction = UIAlertAction(title: "2nd Alert Action", style: .default) { _ in
            print("2nd Alert Action")
        }
        alert.addAction(firstAlertAction)
        alert.addAction(secondAlertAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
