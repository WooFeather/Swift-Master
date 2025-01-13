//
//  BongflixViewController.swift
//  AutoLayoutProgrammatically
//
//  Created by 조우현 on 1/13/25.
//

import UIKit
import SnapKit

class BongflixViewController: UIViewController {
    
    lazy var titleLabel = {
        let label = UILabel()
        label.text = "BONGFLIX"
        label.textColor = .red
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var emailTextField: UITextField = configureTextField(placeholder: Placeholder.email.rawValue)
    lazy var passwordTextField: UITextField = configureTextField(placeholder: Placeholder.password.rawValue)
    lazy var nicknameTextField: UITextField = configureTextField(placeholder: Placeholder.nickname.rawValue)
    lazy var locationTextField: UITextField = configureTextField(placeholder: Placeholder.location.rawValue)
    lazy var recommendationCodeTextField: UITextField = configureTextField(placeholder: Placeholder.recommendationCode.rawValue)
    
    lazy var signUpButton = {
        let btn = UIButton()
        btn.setTitle("회원가입", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 4
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        essentialDesign()
        labelConfig()
        textFieldConfig()
        buttonConfig()
    }
    
    @objc
    func textFieldDidEndOnExit() {
        view.endEditing(true)
    }
    
    func configureTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.textAlignment = .center
        textField.backgroundColor = .lightGray
        textField.layer.cornerRadius = 4
        textField.addTarget(self, action: #selector(textFieldDidEndOnExit), for: .editingDidEndOnExit)
        return textField
    }
    
    func textFieldConfig() {
        // 고차함수 이용해보기!
        [emailTextField, passwordTextField, nicknameTextField, locationTextField, recommendationCodeTextField].forEach {
            view.addSubview($0)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(140)
            make.horizontalEdges.equalTo(view).inset(42)
            make.height.equalTo(34)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(14)
            make.horizontalEdges.equalTo(view).inset(42)
            make.height.equalTo(34)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(14)
            make.horizontalEdges.equalTo(view).inset(42)
            make.height.equalTo(34)
        }
        
        locationTextField.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom).offset(14)
            make.horizontalEdges.equalTo(view).inset(42)
            make.height.equalTo(34)
        }
        
        recommendationCodeTextField.snp.makeConstraints { make in
            make.top.equalTo(locationTextField.snp.bottom).offset(14)
            make.horizontalEdges.equalTo(view).inset(42)
            make.height.equalTo(34)
        }
    }
    
    func buttonConfig() {
        view.addSubview(signUpButton)
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(recommendationCodeTextField.snp.bottom).offset(14)
            make.horizontalEdges.equalTo(view).inset(42)
            make.height.equalTo(40)
        }
    }
    
    func labelConfig() {
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(44)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(30)
        }
    }
    
    func essentialDesign() {
        view.backgroundColor = .black
    }
}
