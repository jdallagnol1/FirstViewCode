//
//  ViewController.swift
//  ViewCodeExercise
//
//  Created by João Dall Agnol on 03/02/23.
//      For some reason elements as buttons and textfields doesnt work when creating loginFormView and adding them to the main

import UIKit


class VC_WithoutSnapKit: UIViewController {
    
    private lazy var loginFormStackView: UIStackView = {
        let loginFormStackView = UIStackView()
        loginFormStackView.axis = .vertical
        loginFormStackView.spacing = 16
        loginFormStackView.translatesAutoresizingMaskIntoConstraints = false
        return loginFormStackView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 4
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.textColor = .white
        label.numberOfLines = 3
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var usernameTextField: UITextField = {
        let usernameTextField = UITextField()
        usernameTextField.placeholder = "user nameamm"
        usernameTextField.textAlignment = .left
        usernameTextField.textColor = .black
        usernameTextField.keyboardType = .default
        usernameTextField.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.2)
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.borderColor = UIColor.red.cgColor
        usernameTextField.layer.cornerRadius = 4
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        return usernameTextField
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .white
        label.numberOfLines = 1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "password porram"
        passwordTextField.textAlignment = .left
        passwordTextField.textColor = .black
        passwordTextField.keyboardType = .default
        passwordTextField.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.2)
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.red.cgColor
        passwordTextField.layer.cornerRadius = 4
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()
    
    private lazy var enterButton: UIButton = {
        let enterButton = UIButton()
        enterButton.layer.cornerRadius = 4
        enterButton.setTitle("Entrar", for: .normal)
        enterButton.setTitleColor(.white, for: .normal)
        enterButton.backgroundColor = .systemBlue
        enterButton.isUserInteractionEnabled = true
        enterButton.addTarget(self, action: #selector(self.enterButtonTapped), for: UIControl.Event.touchUpInside)
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        return enterButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "login page"
        keyboardConfig()
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

extension VC_WithoutSnapKit: ViewCodeConfiguration {
    
    func buildHierarchy() {
        loginFormStackView.addArrangedSubview(usernameLabel)
        loginFormStackView.addArrangedSubview(usernameTextField)
        loginFormStackView.addArrangedSubview(passwordLabel)
        loginFormStackView.addArrangedSubview(passwordTextField)
        loginFormStackView.addArrangedSubview(enterButton)
        
        view.addSubview(imageView)
        view.addSubview(loginFormStackView)
    }
    
    func setupConstraints() {
        let imageViewConstraints = [
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height/8),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200)
        ]

        let loginFormStackViewConstraints = [
            loginFormStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 48)
        ]

        let usernameLabelConstraints = [
            usernameLabel.topAnchor.constraint(equalTo: loginFormStackView.topAnchor),
            usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let usernameTextFieldConstraints = [
            usernameTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor),
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let passwordLabelConstraints = [
            passwordLabel.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 15),
            passwordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let passwordTextFieldConstraint = [
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let enterButtonConstraint = [
            enterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 60),
            enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(imageViewConstraints)
        NSLayoutConstraint.activate(loginFormStackViewConstraints)
        NSLayoutConstraint.activate(usernameLabelConstraints)
        NSLayoutConstraint.activate(usernameTextFieldConstraints)
        NSLayoutConstraint.activate(passwordLabelConstraints)
        NSLayoutConstraint.activate(passwordTextFieldConstraint)
        NSLayoutConstraint.activate(enterButtonConstraint)
        
    }
    
    
    
    func configureViews() {
        
    }
}
