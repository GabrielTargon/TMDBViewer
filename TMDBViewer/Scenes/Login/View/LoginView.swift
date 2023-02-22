//
//  LoginView.swift
//  TMDBViewer
//

import UIKit

final class LoginView: UIView {
    
    weak var viewController: LoginDisplayLogic?
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView(image: LoginImages.background.raw)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var usernameTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = LoginTexts.usernameField.localized
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.delegate = self
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = LoginTexts.passwordField.localized
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.isSecureTextEntry = true
        textField.delegate = self
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(LoginTexts.loginButton.localized, for: .normal)
        button.setTitleColor(.gray, for: .disabled)
        button.backgroundColor = .tmdbSlateGrey
        button.layer.cornerRadius = 10
        button.isEnabled = false
        button.addTarget(self,
                         action: #selector(loginAction),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var fastLoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(LoginTexts.fastLoginButton.localized, for: .normal)
        button.setTitleColor(.gray, for: .disabled)
        button.backgroundColor = .tmdbSlateGrey
        button.layer.cornerRadius = 10
        button.addTarget(self,
                         action: #selector(fastLoginAction),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [usernameTextField,
                                                   passwordTextField,
                                                   loginButton,
                                                   fastLoginButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        UIViewController().loadViewIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private methods
    
    @objc func loginAction() {
        let user = Login.User.Request(username: usernameTextField.text ?? String(),
                                      password: passwordTextField.text ?? String())
        viewController?.didSelectLogin(user: user)
    }
    
    @objc func fastLoginAction() {
        viewController?.didSelectFastLogin()
    }
}

extension LoginView: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        guard let userText = usernameTextField.text else {
            return false
        }
        guard let passText = passwordTextField.text else {
            return false
        }
        
        if !userText.isEmpty && !passText.isEmpty {
            loginButton.isEnabled = true
            loginButton.backgroundColor = .tmdbAlgaeGreen
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = .tmdbSlateGrey
        }
        
        return true
    }
}

extension LoginView: ViewCode {
    func setupHierarchy() {
        addSubview(backgroundImage)
        addSubview(vStack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            usernameTextField.leadingAnchor.constraint(equalTo: vStack.leadingAnchor),
            usernameTextField.trailingAnchor.constraint(equalTo: vStack.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: vStack.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: vStack.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.leadingAnchor.constraint(equalTo: vStack.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: vStack.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            fastLoginButton.heightAnchor.constraint(equalToConstant: 40),
            fastLoginButton.leadingAnchor.constraint(equalTo: vStack.leadingAnchor),
            fastLoginButton.trailingAnchor.constraint(equalTo: vStack.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            vStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)
        ])
    }
}
