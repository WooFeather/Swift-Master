//
//  LotteryViewController.swift
//  NetworkingProject
//
//  Created by 조우현 on 1/14/25.
//

import UIKit
import SnapKit

class LotteryViewController: UIViewController, ViewConfiguration {
    
    let pickerTextField = UITextField()
    let pickerView = UIPickerView()
    let infoLabel = UILabel()
    let dateLabel = UILabel()
    let dividerView = UIView()
    let resultLabel = UILabel()
    let movieButton = UIButton()
    lazy var numberCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionViewLayout())
    var pickerItems: [Int] = Array(1000...1154)
    var pickedItem = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureView()
        
        pickerTextFieldConfig()
    }

    func configureHierarchy() {
        view.addSubview(pickerTextField)
        view.addSubview(infoLabel)
        view.addSubview(dateLabel)
        view.addSubview(dividerView)
        view.addSubview(resultLabel)
        view.addSubview(numberCollectionView)
        view.addSubview(movieButton)
    }
    
    func configureLayout() {
        pickerTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view).inset(24)
            make.height.equalTo(44)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(pickerTextField.snp.bottom).offset(24)
            make.leading.equalTo(view).offset(24)
            make.height.equalTo(17)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(pickerTextField.snp.bottom).offset(24)
            make.trailing.equalTo(view).offset(-24)
            make.height.equalTo(17)
        }
        
        dividerView.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(view).inset(24)
            make.height.equalTo(1)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(dividerView.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
    }
    
    func configureView() {
        view.backgroundColor = .white
        
        pickerTextField.textAlignment = .center
        pickerTextField.borderStyle = .roundedRect
        pickerTextField.placeholder = "원하는 회차를 선택하세요"
        pickerTextField.tintColor = .clear
        
        infoLabel.text = "당첨번호 안내"
        infoLabel.font = .systemFont(ofSize: 14)
        
        dateLabel.text = "2020-05-30 추첨" // 네트워킹 연결이후 수정예정
        dateLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = .gray
        
        dividerView.backgroundColor = .systemGray5
        
        resultLabel.text = "913회 당첨결과" // 네트워킹 연결이후 수정예정
        resultLabel.font = .systemFont(ofSize: 25, weight: .bold)
        resultLabel.textColor = .orange
        resultLabel.attributedText = resultLabelTextAttribute()
    }
    
    func pickerTextFieldConfig() {
        pickerTextField.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    func resultLabelTextAttribute() -> NSMutableAttributedString {
        if let text = self.resultLabel.text {
            let attributeString = NSMutableAttributedString(string: text)
            attributeString.addAttribute(.foregroundColor, value: UIColor.black, range: (text as NSString).range(of: "당첨결과"))
            attributeString.addAttribute(.font, value: UIFont.systemFont(ofSize: 25, weight: .regular), range: (text as NSString).range(of: "당첨결과"))
            
            return attributeString
        }
        return NSMutableAttributedString.init()
    }
    
    func createCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50, height: 50)
        layout.scrollDirection = .vertical
        
        return layout
    }
}

extension LotteryViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerItems.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let rowItem = pickerItems.reversed()[row]
        return String(rowItem)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 네트워크 요청
    }
}
