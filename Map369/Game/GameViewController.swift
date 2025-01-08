//
//  GameViewController.swift
//  Map369
//
//  Created by 조우현 on 1/8/25.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var selectTextField: UITextField!
    @IBOutlet var resultTextView: UITextView!
    @IBOutlet var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabelConfig()
        selectTextFieldConfig()
        resultTextViewConfig()
        countLabelConfig()
    }

    func titleLabelConfig() {
        titleLabel.text = "369 게임"
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
    }
    
    func selectTextFieldConfig() {
        selectTextField.placeholder = "최대 숫자를 입력해주세요"
        selectTextField.font = .systemFont(ofSize: 20)
        selectTextField.textAlignment = .center
        selectTextField.borderStyle = .line
    }
    
    func resultTextViewConfig() {
        resultTextView.isUserInteractionEnabled = false
        resultTextView.font = .systemFont(ofSize: 20)
        resultTextView.textColor = .lightGray
    }
    
    func countLabelConfig() {
        countLabel.font = .systemFont(ofSize: 30, weight: .bold)
        countLabel.textAlignment = .center
        countLabel.numberOfLines = 0
    }
}
