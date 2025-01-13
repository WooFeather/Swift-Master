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
    
    lazy var emailTextField: UITextField = configureTextField(placeholder: "이메일 주소 또는 전화번호")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        essentialDesign()
        labelConfig()
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
        textField.addTarget(self, action: #selector(textFieldDidEndOnExit), for: .editingDidEndOnExit)
        return textField
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
