//
//  RegistrationController.swift
//  strapi-chat
//
//  Created by Jonathan Farber on 08/07/2020.
//  Copyright © 2020 Jonathan Farber. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController {
    
    //  MARK: @Properties
    
    private var viewModel = RegistrationViewModel()
    private let fullNameTextField = InputTextField(placeholder: "Full Name")
    private let userNameTextField = InputTextField(placeholder: "User Name")
    private let emailTextField = InputTextField(placeholder: "Email")
    private let passwordTextField = InputTextField(placeholder: "Password")
    private let passwordConfirmTextField = InputTextField(placeholder: "Password Confirm")

    private let avatarButton: AvatarButton = {
        let button = AvatarButton()
        button.addTarget(self, action: #selector(addPhotoListener), for: .touchUpInside)
        return button
    }()
    
    private lazy var fullNameContainerView: InputContainerView = {
        return InputContainerView(image: #imageLiteral(resourceName: "full_name"), textField: fullNameTextField, isSecure: false)
    }()
    
    private lazy var userNameContainerView: InputContainerView = {
        return InputContainerView(image: #imageLiteral(resourceName: "user_name"), textField: userNameTextField, isSecure: false)
    }()
    
    private lazy var emailContainerView: InputContainerView = {
        return InputContainerView(image: #imageLiteral(resourceName: "email"), textField: emailTextField, isSecure: false)
    }()
    
    private lazy var passwordContainerView: InputContainerView = {
        return InputContainerView(image: #imageLiteral(resourceName: "password"), textField: passwordTextField, isSecure: true)
    }()
    
    private lazy var passwordConfirmContainerView: InputContainerView = {
        return InputContainerView(image: #imageLiteral(resourceName: "password"), textField: passwordConfirmTextField, isSecure: true)
    }()
    
    private let signUpButtn: AuthButton = {
        let button = AuthButton(title: "Sign Up")
        button.addTarget(self, action: #selector(signUpListener), for: .touchUpInside)
        return button
    }()
    
    private let loginHyperLink: AuthFooterButton = {
        let button = AuthFooterButton(title: "Already Have an Account? ", hyperLink: "Log In")
        button.addTarget(self, action: #selector(loginLinkListener), for: .touchUpInside)
        return button
    }()
    
    //  MARK: @LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //  MARK: @Listeners
    
    @objc func addPhotoListener(){
        let imagePicekerController = UIImagePickerController()
        imagePicekerController.delegate = self
        present(imagePicekerController, animated: true, completion: nil)
    }
    
    @objc func loginLinkListener(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func textChangedListener(sender: UITextField){
        if sender == emailTextField{
            viewModel.email = sender.text
        } else if sender == userNameTextField{
            viewModel.user = sender.text
        } else if sender == fullNameTextField{
            viewModel.name = sender.text
        } else if sender == passwordTextField{
            viewModel.password = sender.text
        } else if sender == passwordConfirmTextField{
            viewModel.confirm = sender.text
        }
        validationHandler()
    }

    @objc func signUpListener() {
        print("Signed In")
    }
    
    //  MARK: @Handlers
    
    func textChangedHandler() {
        fullNameTextField.addTarget(self, action: #selector(textChangedListener), for: .editingChanged)
        userNameTextField.addTarget(self, action: #selector(textChangedListener), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textChangedListener), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textChangedListener), for: .editingChanged)
        passwordConfirmTextField.addTarget(self, action: #selector(textChangedListener), for: .editingChanged)
    }
    
    //  MARK: @UIconfiguration
    
    func configureUI() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        configureGradientLayer()
        
        view.addSubview(avatarButton)
        avatarButton.centerX(inView: view)
        avatarButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        avatarButton.setDimensions(height: 176, width: 176)
        
        let stackView = UIStackView(arrangedSubviews: [emailContainerView,
                                                       fullNameContainerView,
                                                       userNameContainerView,
                                                       passwordContainerView,
                                                       passwordConfirmContainerView,
                                                       signUpButtn])
        stackView.axis = .vertical
        stackView.spacing = 16
        
        view.addSubview(stackView)
        stackView.anchor(top: avatarButton.bottomAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingTop: 64,
                         paddingLeft: 64,
                         paddingRight: 64)
        
        view.addSubview(loginHyperLink)
        loginHyperLink.anchor(left: view.leftAnchor,
                                bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                right: view.rightAnchor,
                                paddingLeft: 8,
                                paddingBottom: 16,
                                paddingRight: 8)
        
        textChangedHandler()
    }
}

//  MARK: @UIImagePickerControllerDelegate

extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.originalImage] as? UIImage
        avatarButton.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        avatarButton.layer.borderColor = UIColor.white.cgColor
        avatarButton.layer.borderWidth = 3.0
        avatarButton.layer.cornerRadius = 200 / 2.5
        
        dismiss(animated: true, completion: nil)
    }
}

// MARK: @ProtocolExtensions

extension RegistrationController: AuthenticationProtocol {
    
    func validationHandler() {
        if viewModel.isValid {
            signUpButtn.isEnabled = true
            signUpButtn.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            signUpButtn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        } else {
            signUpButtn.isEnabled = false
            signUpButtn.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            signUpButtn.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
        }
    }
}
