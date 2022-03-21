//
//  LogInViewController.swift
//  Navigation
//
//  Created by Ivan Chaschin on 21.02.2022.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
        self.loginTextField.delegate = self
        self.passwordTextField.delegate = self
        //        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        setupContentView()
        
        // Скрытие клавиатуры по tap
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private lazy var logInScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.toAutoLayout()
        
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let logInHeaderView = UIView()
        logInHeaderView.toAutoLayout()
        
        return logInHeaderView
    }()
    
    private lazy var logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.toAutoLayout()
        logoImage.clipsToBounds = true
        logoImage.image = UIImage(named: "logo")
        
        return logoImage
    }()
    
    private lazy var loginTextField: UITextField = {
        let loginTF = UITextField()
        loginTF.toAutoLayout()
        loginTF.clipsToBounds = true
        loginTF.textColor = .black
        loginTF.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        loginTF.placeholder = "Email or Phone"
        loginTF.layer.borderWidth = 0.5
        loginTF.layer.borderColor = UIColor.lightGray.cgColor
        loginTF.backgroundColor = .systemGray6
        loginTF.autocapitalizationType = .none
        loginTF.autocorrectionType = .no
        loginTF.keyboardType = .emailAddress
        loginTF.returnKeyType = .done
        return loginTF
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTF = UITextField()
        passwordTF.toAutoLayout()
        passwordTF.clipsToBounds = true
        passwordTF.textColor = .black
        passwordTF.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordTF.placeholder = "Password"
        passwordTF.layer.borderWidth = 0.5
        passwordTF.layer.borderColor = UIColor.lightGray.cgColor
        passwordTF.backgroundColor = .systemGray6
        passwordTF.autocapitalizationType = .none
        passwordTF.autocorrectionType = .no
        passwordTF.returnKeyType = .done
        passwordTF.isSecureTextEntry = true
        
        return passwordTF
    }()
    
    private lazy var textFieldsStackView: UIStackView = {
        let textFieldsStackView = UIStackView()
        textFieldsStackView.toAutoLayout()
        textFieldsStackView.axis = .vertical
        textFieldsStackView.distribution = .fillProportionally
        textFieldsStackView.clipsToBounds = true
        textFieldsStackView.layer.cornerRadius = 10
        textFieldsStackView.layer.borderWidth = 0.5
        textFieldsStackView.layer.borderColor = UIColor.lightGray.cgColor
        textFieldsStackView.backgroundColor = .systemGray6
        
        return textFieldsStackView
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.clipsToBounds = true
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.textColor = UIColor.white
        
        if let image = UIImage(named: "blue_pixel") {
            button.setBackgroundImage(image.image(alpha: 1), for: .normal)
            button.setBackgroundImage(image.image(alpha: 0.8), for: .selected)
            button.setBackgroundImage(image.image(alpha: 0.8), for: .highlighted)
            button.setBackgroundImage(image.image(alpha: 0.8), for: .disabled)
        }
        button.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    func setupLogoInConstraints() {
        NSLayoutConstraint.activate([
            logInScrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0),
            logInScrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0),
            logInScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            logInScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            
            contentView.leftAnchor.constraint(equalTo: logInScrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: logInScrollView.rightAnchor),
            contentView.topAnchor.constraint(equalTo: logInScrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: logInScrollView.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: logInScrollView.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: logInScrollView.centerYAnchor),
            
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            textFieldsStackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            textFieldsStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            textFieldsStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            textFieldsStackView.heightAnchor.constraint(equalToConstant: 100),
            
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.topAnchor.constraint(equalTo: textFieldsStackView.bottomAnchor, constant: 16),
            logInButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            logInButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16)
            
        ])
        
    }
    
    private func setupContentView() {
        
        self.view.addSubview(logInScrollView)
        logInScrollView.addSubview(contentView)
        contentView.addSubviews(logoImage, textFieldsStackView, logInButton)
        textFieldsStackView.addArrangedSubview(loginTextField)
        textFieldsStackView.addArrangedSubview(passwordTextField)
        
        setupLogoInConstraints()
        
    }
    
    @objc private func logInButtonPressed(sender: UIButton!) {
        guard loginTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false else { return }
        self.navigationController?.popViewController(animated: true)
        navigationController?.navigationBar.isHidden = false
    }
    
    @objc func keyboardShow(_ notification: Notification){
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            logInScrollView.contentOffset.y = keyboardRectangle.height - (logInScrollView.frame.height - logInButton.frame.minY) + 50
        }
    }
    
    @objc func keyboardHide(_ notification: Notification) {
        logInScrollView.contentOffset = CGPoint(x: 0, y: 0)
    }
    
    @objc func tap() {
        passwordTextField.resignFirstResponder()
        loginTextField.resignFirstResponder()
    }
    
}

// MARK: Alpha UIImage
extension UIImage {
    func image(alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: alpha)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
}

