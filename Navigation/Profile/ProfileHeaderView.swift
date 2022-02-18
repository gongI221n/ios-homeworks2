//
//  ProfileHeaderUIView.swift
//  Navigation
//
//  Created by Ivan Chaschin on 17.02.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
    // MARK: Avatar image
    var avatar: UIImageView = {
        let avatar = UIImageView()
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.clipsToBounds = true
        avatar.image = UIImage(named: "avatar")
        avatar.layer.cornerRadius = 75
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        
        return avatar
    }()
    
    
    //MARK: Name Label
    var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.clipsToBounds = true
        nameLabel.text = "Chaschin Ivan"
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        return nameLabel
    }()
    
    //MARK: Status button
    var statusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.backgroundColor = .systemBlue
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowOpacity = 0.7
        statusButton.setTitle("Set Status", for: .normal)
        statusButton.tintColor = .white
        statusButton.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        
        return statusButton
    }()
    
    //MARK: Status Label
    var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = "Waiting for something"
        statusLabel.numberOfLines = 2
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        return statusLabel
        
    }()
    
    //MARK: Text Field for status setting
    var statusTF: UITextField = {
        let statusTF = UITextField()
        statusTF.translatesAutoresizingMaskIntoConstraints = false
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
        
        
        return statusTF
    }()
    
    // MARK: Constraints
    func SetupConstraints() {
        NSLayoutConstraint.activate([
            avatar.widthAnchor.constraint(equalToConstant: 150),
            avatar.heightAnchor.constraint(equalTo: avatar.widthAnchor),
            avatar.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            avatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            
            nameLabel.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            
            statusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            statusButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            statusButton.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            statusLabel.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 20),
            statusLabel.bottomAnchor.constraint(equalTo: statusTF.topAnchor, constant: -6),
            statusLabel.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            
            statusTF.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 20),
            statusTF.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16),
            statusTF.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),
            statusTF.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    
    //MARK: TF Action
    @objc func statusTextChanged(_ textField: UITextField) {
        guard let text = textField.text else { return }
        statusText = text
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
        addSubview(avatar)
        addSubview(nameLabel)
        addSubview(statusButton)
        addSubview(statusLabel)
        addSubview(statusTF)
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
}

