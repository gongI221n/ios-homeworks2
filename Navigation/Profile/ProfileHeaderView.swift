//
//  ProfileHeaderUIView.swift
//  Navigation
//
//  Created by Ivan Chaschin on 17.02.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    private var statusText: String = ""
    static let identifire = "ProfileHeaderView"
//    var defaultAvatarCenter: CGPoint = CGPoint(x: 0, y: 0)
    
    var avatarWidthConstraint: NSLayoutConstraint!
    var avatarHeightConstraint: NSLayoutConstraint!
    var avatarXConstraint: NSLayoutConstraint!
    var avatarYConstraint: NSLayoutConstraint!
    var avatarLeftConstraint: NSLayoutConstraint!
    var avatarTopConstraint: NSLayoutConstraint!
    
    var avatarNewWidthConstraint: NSLayoutConstraint!
    var avatarNewHeightConstraint: NSLayoutConstraint!

    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(nameLabel, statusButton, statusLabel, statusTF, plagView, plagEscButton, avatar)
        SetupConstraints()
    }
    
    // MARK: plagView
    private lazy var plagView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.toAutoLayout()
        view.alpha = 0
        view.backgroundColor = .systemGray
        view.isUserInteractionEnabled = false

        return view
    }()
    
    // MARK: plagEscButton
    private lazy var plagEscButton: UIButton = {
       let button = UIButton()
        button.toAutoLayout()
        button.setImage(UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        button.backgroundColor = .clear
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapPlagEscButton))
        button.addGestureRecognizer(gesture)
        button.isUserInteractionEnabled = false
        button.alpha = 0
        
        
        return button
    }()
    
    // MARK: Avatar image
    private lazy var avatar: UIImageView = {
        let avatar = UIImageView()
        avatar.toAutoLayout()
        avatar.clipsToBounds = true
        avatar.image = UIImage(named: "avatar")
        avatar.layer.cornerRadius = 60
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapOnAvatar))
        recognizer.numberOfTapsRequired = 1
        avatar.addGestureRecognizer(recognizer)
        avatar.isUserInteractionEnabled = true
        
        return avatar
    }()
    
    
    //MARK: Name Label
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.toAutoLayout()
        nameLabel.clipsToBounds = true
        nameLabel.text = "Chaschin Ivan"
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        return nameLabel
    }()
    
    //MARK: Status button
    private lazy var statusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.toAutoLayout()
        statusButton.backgroundColor = .systemBlue
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowOpacity = 0.7
        statusButton.setTitle("Set Status", for: .normal)
        statusButton.setTitleColor(.lightGray, for: .normal)
        statusButton.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        
        return statusButton
    }()
    
    //MARK: Status Label
    private lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.toAutoLayout()
        statusLabel.text = "Waiting for something"
        statusLabel.numberOfLines = 2
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        return statusLabel
        
    }()
    
    //MARK: Text Field for status setting
    private lazy var statusTF: UITextField = {
        let statusTF = UITextField()
        statusTF.toAutoLayout()
        statusTF.layer.borderWidth = 1
        statusTF.layer.borderColor = UIColor.black.cgColor
        statusTF.layer.cornerRadius = 12
        statusTF.backgroundColor = .white
        statusTF.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTF.textColor = .black
        statusTF.placeholder = "Set status"
        statusTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: statusTF.frame.height))
        statusTF.leftViewMode = .always
        statusTF.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        statusTF.returnKeyType = .done
        
        return statusTF
    }()

    // MARK: Constraints
    func SetupConstraints() {
        
        self.avatarWidthConstraint = self.avatar.widthAnchor.constraint(equalToConstant: 120)
        self.avatarHeightConstraint = self.avatar.heightAnchor.constraint(equalTo: avatar.widthAnchor)
        self.avatarLeftConstraint = self.avatar.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16)
        self.avatarTopConstraint =  self.avatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        
        NSLayoutConstraint.activate([
            avatarWidthConstraint,
            avatarHeightConstraint,
            avatarLeftConstraint,
            avatarTopConstraint,
            
            nameLabel.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            
            statusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            statusButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            statusButton.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -64),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            statusLabel.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 20),
            statusLabel.bottomAnchor.constraint(equalTo: statusTF.topAnchor, constant: -6),
            statusLabel.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            
            statusTF.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 20),
            statusTF.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16),
            statusTF.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),
            statusTF.heightAnchor.constraint(equalToConstant: 40),
            
            plagEscButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            plagEscButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            
        ])
        
    }
    
    
    //MARK: TF Action. Button isEnabled
    @objc func statusTextChanged(_ textField: UITextField) {
        guard let text = textField.text else { return }
        statusText = text
        if statusTF.text?.isEmpty == false {
            statusButton.isEnabled = true
            statusButton.setTitleColor(.white, for: .normal)
            
        } else {
            statusButton.isEnabled = false
            statusButton.setTitleColor(.lightGray, for: .normal)
        }
    }
    
    // MARK: Button Action
    @objc func pressButton(){
        if statusLabel.text != nil && statusText != "" {
            statusLabel.text = statusText
            statusTF.text = ""
            statusTF.resignFirstResponder()
        }
        
    }
    
    
    // MARK: Add Subviews
    func addView() {
        addSubviews(avatar, nameLabel, statusButton, statusLabel, statusTF)
        
    }
    
    // MARK: Создание Toolbar и кнопки на нем "Готово"
    func createToolbar() {
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit() // Размер toolbar под размер toollbar
        
        let doneButton = UIBarButtonItem(title: "Готово",
                                         style: .plain,
                                         target: self,
                                         action: #selector(dismissKeyboard))
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) // "Невидимое пространство для смещения кнопки "Готово" к правому краю
        
        toolbar.setItems([flexibleSpace, doneButton], animated: true) // Размещение кнопок из массива в toolbar
        toolbar.isUserInteractionEnabled = true // Позволяем взаимодействовать пользователю с данным элементом
        
        statusTF.inputAccessoryView = toolbar // Встраиваем toolbar при нажатии на textView
        
    }
    
    @objc func dismissKeyboard() { // Метод скрытия клавиатуры по нажатию на кнопку Готово
        self.endEditing(true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapOnAvatar() {
        UIImageView.animate(withDuration: 0.5) {
            // Я знаю, что можно было сделать как ниже в комментах. Но я не совсем сначала понял как это изнутри делается (трансформ), так что решил через понятные мне констрейнты - в общем 3 вечера страдал и сделал вроде, но остались косяки в том, что привязанные к аватарке констрейнты уезжают за экран и это как бы видно. Я знаю как это исправить, но уже отправлю как есть.
//            self.defaultAvatarCenter = self.avatar.center
//            self.avatar.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
//            self.avatar.transform = CGAffineTransform(scaleX: self.contentView.frame.width / self.avatar.frame.width, y: self.contentView.frame.width / self.avatar.frame.width)
            
            self.avatar.layer.cornerRadius = 0
            self.avatar.layer.borderWidth = 0
            
            self.avatarWidthConstraint = self.avatar.widthAnchor.constraint(equalTo: self.superview!.widthAnchor)
            self.avatarHeightConstraint = self.avatar.heightAnchor.constraint(equalTo: self.superview!.widthAnchor)
            self.avatarXConstraint = self.avatar.centerXAnchor.constraint(equalTo: self.superview!.centerXAnchor)
            self.avatarYConstraint = self.avatar.centerYAnchor.constraint(equalTo: self.superview!.centerYAnchor)
            
            self.avatarNewWidthConstraint = self.avatar.widthAnchor.constraint(equalToConstant: 120)
            self.avatarNewHeightConstraint = self.avatar.heightAnchor.constraint(equalTo: self.avatar.widthAnchor)
            
            NSLayoutConstraint.activate([self.avatarWidthConstraint,
                                         self.avatarHeightConstraint,
                                         self.avatarXConstraint,
                                         self.avatarYConstraint])
            
            self.plagView.backgroundColor = .systemGray
            self.plagView.alpha = 0.9
            self.plagEscButton.isUserInteractionEnabled = true
            ProfileViewController.postTableView.isScrollEnabled = false
            ProfileViewController.postTableView.cellForRow(at: IndexPath(item: 0, section: 0))?.isUserInteractionEnabled = false
            self.avatar.isUserInteractionEnabled = false
            self.superview?.layoutIfNeeded()
            
        } completion: { _ in
            UIImageView.animate(withDuration: 0.3) {
                self.plagEscButton.alpha = 1

            }
        }
    }
    
    @objc func tapPlagEscButton() {

        UIImageView.animate(withDuration: 0.3) {
            self.plagEscButton.alpha = 0
            
        } completion: { _ in
            UIImageView.animate(withDuration: 0.5) {
                
                NSLayoutConstraint.deactivate([self.avatarWidthConstraint,
                                               self.avatarHeightConstraint,
                                               self.avatarXConstraint,
                                               self.avatarYConstraint,
                                               self.avatarTopConstraint,
                                               self.avatarLeftConstraint
                                              ])
                
                self.superview?.layoutIfNeeded()
                
                NSLayoutConstraint.activate([
                    self.avatarNewWidthConstraint,
                    self.avatarNewHeightConstraint,
                    self.avatarLeftConstraint,
                    self.avatarTopConstraint
                ])
                
                self.avatar.layer.cornerRadius = self.avatar.frame.width / 2
                self.avatar.layer.borderWidth = 3
                self.plagView.alpha = 0
                ProfileViewController.postTableView.isScrollEnabled = true
                ProfileViewController.postTableView.cellForRow(at: IndexPath(item: 0, section: 0))?.isUserInteractionEnabled = true
                self.avatar.isUserInteractionEnabled = true
                self.superview?.layoutIfNeeded()
            }
        }
    }
}


public extension UIView {
    
    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
    
}





