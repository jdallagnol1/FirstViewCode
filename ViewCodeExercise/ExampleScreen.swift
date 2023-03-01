import UIKit
////
////  CreateAccountViewController.swift
////  VolunteerApp
////
////  Created by Lucca Molon on 06/07/22.
////
//import UIKit
//
//class CreateAccountViewController: UIViewController {
//    //MARK: - Lifecycle
//
//    init(viewModel: CreateAccountViewModel) {
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.setupUI()
//        emailTextField.delegate = self
//        passwordTextField.delegate = self
//        repeatPasswordTextField.delegate = self
//    }
//
//    //MARK: - Properties
//    var coordinator: CreateAccountFlow?
//    var tempUser: CreateAccountModel?
//    var viewModel: CreateAccountViewModel
//
////
//    private lazy var createAccountLabel: UILabel = {
//        let label = UILabel()
//        label.text = NSLocalizedString("Create Account", comment: "")
//        label.textAlignment = .left
//        label.font = UIFont.title1()
//        label.translatesAutoresizingMaskIntoConstraints = false
//
//        return label
//    }()
////
//    private lazy var textFieldStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.spacing = 16
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        return stackView
//    }()
//
//    private lazy var emailTextField: CustomTextField = {
//        let textField = CustomTextField(placeholder: "Email", type: .email)
//        textField.translatesAutoresizingMaskIntoConstraints = false
//
//        return textField
//    }()
//
//    private lazy var emailErrorLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.small()
//        label.textColor = UIColor.systemRed
//        label.translatesAutoresizingMaskIntoConstraints = false
//
//        return label
//    }()
//
//    private lazy var passwordTextField: CustomTextField = {
//        let textField = CustomTextField(placeholder: "Password", type: .password)
//        textField.translatesAutoresizingMaskIntoConstraints = false
//
//        return textField
//    }()
//
//    private lazy var repeatPasswordTextField: CustomTextField = {
//        let textField = CustomTextField(placeholder: "Repeat Password", type: .password)
//        textField.translatesAutoresizingMaskIntoConstraints = false
//
//        return textField
//    }()
//
//    private lazy var passwordErrorLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.small()
//        label.textColor = UIColor.systemRed
//        label.translatesAutoresizingMaskIntoConstraints = false
//
//        return label
//    }()
//
//    private lazy var continueButton: CustomButton = {
//        let button = CustomButton(title: "Continue", type: .primary, isActive: false)
//        button.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//
//        return button
//    }()
//
//    //MARK: - UI Setup
//
//    func setupUI() {
//        self.configureSubViews()
//        self.configureStackView()
//        self.configureConstraints()
//
//        view.backgroundColor = .backgroundCaravela()
//        emailErrorLabel.isHidden = true
//        passwordErrorLabel.isHidden = true
//    }
//
//    func configureSubViews() {
//        view.addSubview(createAccountLabel)
//        view.addSubview(textFieldStackView)
//        view.addSubview(continueButton)
//    }
//
//    func configureStackView() {
//        textFieldStackView.addArrangedSubview(emailTextField)
//        textFieldStackView.addArrangedSubview(emailErrorLabel)
//        textFieldStackView.addArrangedSubview(passwordTextField)
//        textFieldStackView.addArrangedSubview(repeatPasswordTextField)
//        textFieldStackView.addArrangedSubview(passwordErrorLabel)
//    }
//
//    func configureConstraints() {
//        let labelConstraints = [
//            createAccountLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 133),
//            createAccountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32)
//        ]
//
//        let textFieldStackViewConstraints = [
//            textFieldStackView.topAnchor.constraint(equalTo: createAccountLabel.bottomAnchor, constant: 20),
//            textFieldStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
//            textFieldStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
//        ]
//
//        let textFieldConstraints = [
//            emailTextField.heightAnchor.constraint(equalToConstant: 40),
//            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
//            repeatPasswordTextField.heightAnchor.constraint(equalToConstant: 40)
//        ]
//
//        let buttonConstraints = [
//            continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -105),
//            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
//            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
//            continueButton.heightAnchor.constraint(equalToConstant: 40)
//        ]
//
//        NSLayoutConstraint.activate(labelConstraints)
//        NSLayoutConstraint.activate(textFieldStackViewConstraints)
//        NSLayoutConstraint.activate(textFieldConstraints)
//        NSLayoutConstraint.activate(buttonConstraints)
//    }
//
//    //MARK: - Actions
//    @objc func nextScreen() {
//
//        if(viewModel.validateData(emailAddress: emailTextField.text, password: passwordTextField.text, confirmPassword: repeatPasswordTextField.text)) {
//            guard let email = emailTextField.text,
//                  let password = passwordTextField.text else {
//                return
//            }
//            viewModel.userInfo.email = email
//            viewModel.userInfo.password = password
//
//            coordinator?.coordinateToFinalCreateAccount(viewModel: viewModel)
//        } else {
//            presentAlert(message: NSLocalizedString("You need to fill all fields", comment: ""), title: NSLocalizedString("Invalid data", comment: ""))
//
//        }
//    }
//}
//
//extension CreateAccountViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.switchBasedNextTextField(textField)
//        return true
//    }
//
//    private func switchBasedNextTextField(_ textField: UITextField) {
//        switch textField {
//        case self.emailTextField:
//            let _ = self.passwordTextField.becomeFirstResponder()
//        case self.passwordTextField:
//            let _ = self.repeatPasswordTextField.becomeFirstResponder()
//        case self.repeatPasswordTextField:
//            nextScreen()
//        default:
//            let _ = self.emailTextField.becomeFirstResponder()
//        }
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
//        if textField == emailTextField {
//            if viewModel.validateEmail(emailAddress: emailTextField.text, completion: { message in
//                self.emailErrorLabel.text = message
//            }) {
//                emailTextField.validator = true
//                emailErrorLabel.isHidden = true
//            } else {
//                emailTextField.validator = false
//                emailErrorLabel.isHidden = false
//            }
//        }
//
//        if textField == repeatPasswordTextField {
//            if viewModel.validatePasswords(password: passwordTextField.text, confirmPassword: repeatPasswordTextField.text, completion: { message in
//                self.passwordErrorLabel.text = message
//            }) {
//                passwordTextField.validator = true
//                passwordTextField.layer.borderWidth = 0
//                repeatPasswordTextField.validator = true
//                passwordErrorLabel.isHidden = true
//            } else {
//                passwordTextField.validator = false
//                passwordTextField.layer.borderWidth = 1.5
//                passwordTextField.layer.borderColor = UIColor.systemRed.cgColor
//                repeatPasswordTextField.validator = false
//                passwordErrorLabel.isHidden = false
//            }
//        }
//
//        if viewModel.validateData(emailAddress: emailTextField.text, password: passwordTextField.text, confirmPassword: repeatPasswordTextField.text) {
//            continueButton.backgroundColor = .purpleCaravela()
//        }
//    }
//}
