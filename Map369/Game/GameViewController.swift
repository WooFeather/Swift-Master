//
//  GameViewController.swift
//  Map369
//
//  Created by 조우현 on 1/8/25.
//

import UIKit

class GameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var selectTextField: UITextField!
    @IBOutlet var resultTextView: UITextView!
    @IBOutlet var countLabel: UILabel!
    
    let pickerView = UIPickerView()
    var pickerItems: [Int] = []
    var resultText: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerItemsDesign()
        selectTextFieldConfig()
        titleLabelDesign()
        selectTextFieldDesign()
        resultTextViewDesign()
        countLabelDesign()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerItems.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        String(pickerItems.reversed()[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        resultText = []
        
        let rowItem = pickerItems.reversed()[row]
        
        for i in 1...rowItem {
            resultText.append(String(i))
        }
        
        resultTextView.text = resultText.joined(separator: " ")
    }
    
    func selectTextFieldConfig() {
        selectTextField.tintColor = .clear
        selectTextField.inputView = pickerView
        
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    func pickerItemsDesign() {
        for i in 1...100 {
            pickerItems.append(i)
        }
    }

    func titleLabelDesign() {
        titleLabel.text = "369 게임"
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
    }
    
    func selectTextFieldDesign() {
        selectTextField.placeholder = "최대 숫자를 입력해주세요"
        selectTextField.font = .systemFont(ofSize: 20)
        selectTextField.textAlignment = .center
        selectTextField.borderStyle = .line
    }
    
    func resultTextViewDesign() {
        resultTextView.isUserInteractionEnabled = false
        resultTextView.font = .systemFont(ofSize: 20)
        resultTextView.textColor = .lightGray
    }
    
    func countLabelDesign() {
        countLabel.font = .systemFont(ofSize: 30, weight: .bold)
        countLabel.textAlignment = .center
        countLabel.numberOfLines = 0
    }
    
    @IBAction func endEditingTapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
