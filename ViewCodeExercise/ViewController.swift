//
//  ViewController.swift
//  ViewCodeExercise
//
//  Created by João Dall Agnol on 03/02/23.
//      For some reason elements as buttons and textfields doesnt work when creating loginFormView and adding them to the main

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    private lazy var loginFormView: UIView = { return UIView(frame: .zero)}()
    
    private lazy var usernameView: UIView = { return UIView(frame: .zero)}()
    
    private lazy var imageView: UIImageView = { return UIImageView(frame: .zero)}()
    private lazy var usernameLabel: UILabel = { return UILabel(frame: .zero)}()
    private lazy var usernameTextField: UITextField = { return UITextField(frame: .zero)}()
    private lazy var passwordLabel: UILabel = { return UILabel(frame: .zero)}()
    private lazy var passwordTextField: UITextField = { return UITextField(frame: .zero)}()
    private lazy var enterButton: UIButton = { return UIButton(frame: .zero)}()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        keyboardConfig()
        
        title = "login page"
        applyViewCode()
    }
    
    func keyboardConfig() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc func enterButtonTapped() {
        print("tapped enter button ow")
    }
    
}

extension ViewController: ViewCodeConfiguration {
    
    func buildHierarchy() {
        view.addSubview(imageView)
        view.addSubview(usernameLabel)
        view.addSubview(usernameTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(enterButton)
        view.addSubview(loginFormView)
    }
    
    func setupConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(200)
        }

        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(5)
            make.centerX.equalToSuperview() // isso crasha
            make.width.equalTo(200)
            make.height.equalTo(50)
        }

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }

        enterButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(80)
        }
    }
    
    func configureViews() {
        
        loginFormView.layer.borderColor = UIColor.red.cgColor
        loginFormView.layer.borderWidth = 20
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "logo")
        
        usernameLabel.text = "insira aqui o username mini querido"
        usernameLabel.textAlignment = .center
        usernameLabel.textColor = .black
        usernameLabel.numberOfLines = 3
        
        usernameTextField.placeholder = "user nameamm"
        usernameTextField.textAlignment = .left
        usernameTextField.textColor = .black
        usernameTextField.keyboardType = .default
        usernameTextField.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.2)
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.borderColor = UIColor.red.cgColor
        usernameTextField.layer.cornerRadius = 4
        
        passwordLabel.text = "insira aqui a senha"
        passwordLabel.textAlignment = .center
        passwordLabel.textColor = .black
        passwordLabel.numberOfLines = 3
        
        passwordTextField.placeholder = "password porram"
        passwordTextField.textAlignment = .left
        passwordTextField.textColor = .black
        passwordTextField.keyboardType = .default
        passwordTextField.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.2)
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.red.cgColor
        passwordTextField.layer.cornerRadius = 4
        
        enterButton.layer.cornerRadius = 4
        enterButton.setTitle("Entrar", for: .normal)
        enterButton.setTitleColor(.white, for: .normal)
        enterButton.backgroundColor = .systemBlue
        enterButton.isUserInteractionEnabled = true
//        enterButton.target(forAction: #selector(self.enterButtonTapped), withSender: self.view)
        enterButton.addTarget(self, action: #selector(self.enterButtonTapped), for: UIControl.Event.touchUpInside)
        
    }
    
}


