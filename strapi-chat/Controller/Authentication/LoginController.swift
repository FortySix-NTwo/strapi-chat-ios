//
//  LoginController.swift
//  strapi-chat
//
//  Created by Jonathan Farber on 08/07/2020.
//  Copyright © 2020 Jonathan Farber. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
  
  //  MARK: @Properties
  private var viewModel = LoginViewModel()
  private let emailTextField = InputTextField(placeholder: "Email")
  private let passwordTextField = InputTextField(placeholder: "Password")
  
  private let iconImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(imageLiteralResourceName: "logo.png")
    imageView.tintColor = .white
    return imageView
  }()
  
  private lazy var emailContainerView: InputContainerView = {
    return InputContainerView(image: #imageLiteral(resourceName: "email"), textField: emailTextField, isSecure: false)
  }()
  
  private lazy var passwordContainerView: InputContainerView = {
    return InputContainerView(image: #imageLiteral(resourceName: "password"), textField: passwordTextField, isSecure: true)
  }()
  
  private let loginButton: AuthButton = {
    let button = AuthButton(title: "Log In")
    button.addTarget(self, action: #selector(loginListener), for: .touchUpInside)
    return button
  }()
  
  private let registrationHyperLink: AuthFooterButton = {
    let button = AuthFooterButton(title: "Don't Have an account Yet? ", hyperLink: "Sign Up")
    button.addTarget(self, action: #selector(registrationListener), for: .touchUpInside)
    return button
  }()
  
  //  MARK: @LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  
  //  MARK: @Listeners
  
  @objc func loginSuccessfulListener() {
    let controller = ConversationsController()
    navigationController?.pushViewController(controller, animated: true)
  }
  
  @objc func registrationListener() {
    let controller = RegistrationController()
    navigationController?.pushViewController(controller, animated: true)
  }
  
  @objc func textChangedListener(sender: UITextField){
    if sender == emailTextField {
      viewModel.email = sender.text
    } else {
      viewModel.password = sender.text
    }
    validationHandler()
  }
  
  @objc func loginListener() {
    guard let email = emailTextField.text else { return }
    guard let password = passwordTextField.text else { return }
    let user = LoginModel(email: email, password: password)
    let failure = UIAlertController(title: "Failure", message: "Invalid Credintails", preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style: .cancel)
    AuthenticationAPI.instance.login(login: user) { (isSuccessful) in
      if isSuccessful {
        self.loginSuccessfulListener()
      } else {
        failure.addAction(ok)
        self.present(failure, animated: true, completion: nil)
      }
    }
  }
  
  // MARK: @Handlers
  
  func textChangedHandler() {
    emailTextField.addTarget(self, action: #selector(textChangedListener), for: .editingChanged)
    passwordTextField.addTarget(self, action: #selector(textChangedListener), for: .editingChanged)
  }
  
  //  MARK: @UIconfiguration
  
  func configureUI() {
    navigationController?.navigationBar.isHidden = true
    navigationController?.navigationBar.barStyle = .black
    configureGradientLayer()
    
    view.addSubview(iconImage)
    iconImage.centerX(inView: view)
    iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
    iconImage.setDimensions(height: 120, width: 120)
    
    let stackView = UIStackView(arrangedSubviews: [emailContainerView,
                                                   passwordContainerView,
                                                   loginButton])
    stackView.axis = .vertical
    stackView.spacing = 16
    view.addSubview(stackView)
    stackView.anchor(top: iconImage.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 64,
                     paddingLeft: 64,
                     paddingRight: 64)
    
    view.addSubview(registrationHyperLink)
    registrationHyperLink.anchor(left: view.leftAnchor,
                                 bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                 right: view.rightAnchor,
                                 paddingLeft: 8,
                                 paddingBottom: 16,
                                 paddingRight: 8)
    
    textChangedHandler()
  }
  
}

// MARK: @ProtocolExtensions

extension LoginController: AuthenticationProtocol {
  func validationHandler() {
    if viewModel.isValid {
      loginButton.isEnabled = true
      loginButton.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
      loginButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
    } else {
      loginButton.isEnabled = false
      loginButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
      loginButton.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
    }
  }
}
