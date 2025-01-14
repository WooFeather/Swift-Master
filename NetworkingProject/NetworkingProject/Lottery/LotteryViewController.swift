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
    let plusLabel = UILabel()
    let bonusLabel = UILabel()
    // 원래는 숫자 뷰를 나타낼 때 컬렉션뷰로 나타내보려고 했었는데, 셀 재사용 매커니즘을 생각하면 배열이 아닌, 변수 하나하나하나를 가져오는건 힘들듯…
//    lazy var numberCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionViewLayout())
    var pickerItems: [Int] = Array(1...1154)
    var pickedItem = 0
    
    let firstNumLabel = UILabel()
    let secondNumLabel = UILabel()
    let thirdNumLabel = UILabel()
    let fourthNumLabel = UILabel()
    let fifthNumLabel = UILabel()
    let sixthNumLabel = UILabel()
    let bonusNumLabel = UILabel()
    
    let tapGesture = UITapGestureRecognizer()
    
    // 네트워킹 전에 뷰를 보기 위해 더미데이터 생성
    let dummyLottery = LotteryDummy().dummy

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
        view.addSubview(movieButton)
        [firstNumLabel, secondNumLabel, thirdNumLabel, fourthNumLabel, fifthNumLabel, sixthNumLabel, bonusNumLabel, plusLabel, bonusLabel].forEach {
            view.addSubview($0)
        }
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
        
        firstNumLabel.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(24)
            make.leading.equalTo(view).offset(24)
            make.size.equalTo(40)
        }
        numberLayout(secondNumLabel, to: firstNumLabel)
        numberLayout(thirdNumLabel, to: secondNumLabel)
        numberLayout(fourthNumLabel, to: thirdNumLabel)
        numberLayout(fifthNumLabel, to: fourthNumLabel)
        numberLayout(sixthNumLabel, to: fifthNumLabel)
        
        bonusNumLabel.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(24)
            make.trailing.equalTo(view).offset(-24)
            make.size.equalTo(40)
        }
        
        plusLabel.snp.makeConstraints { make in
            make.centerY.equalTo(bonusNumLabel.snp.centerY)
            make.trailing.equalTo(bonusNumLabel.snp.leading).offset(-10)
        }
        
        bonusLabel.snp.makeConstraints { make in
            make.top.equalTo(bonusNumLabel.snp.bottom).offset(4)
            make.centerX.equalTo(bonusNumLabel.snp.centerX)
        }
        
        movieButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.center.equalToSuperview()
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
        
        dateLabel.text = "\(dummyLottery.drwNoDate.toDate()?.toString() ?? "-") 추첨" // 네트워킹 연결이후 수정예정
        dateLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = .gray
        
        dividerView.backgroundColor = .systemGray5
        
        resultLabel.text = "\(dummyLottery.drwNo)회 당첨결과" // 네트워킹 연결이후 수정예정
        resultLabel.font = .systemFont(ofSize: 25, weight: .bold)
        resultLabel.textColor = .orange
        resultLabel.attributedText = resultLabel.text?.resultLabelTextAttribute()
        
        numberDesign(firstNumLabel, number: dummyLottery.drwtNo1)
        numberDesign(secondNumLabel, number: dummyLottery.drwtNo2)
        numberDesign(thirdNumLabel, number: dummyLottery.drwtNo3)
        numberDesign(fourthNumLabel, number: dummyLottery.drwtNo4)
        numberDesign(fifthNumLabel, number: dummyLottery.drwtNo5)
        numberDesign(sixthNumLabel, number: dummyLottery.drwtNo6)
        numberDesign(bonusNumLabel, number: dummyLottery.bnusNo)
        
        plusLabel.text = "+"
        plusLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        
        bonusLabel.text = "보너스"
        bonusLabel.font = .systemFont(ofSize: 12)
        bonusLabel.textColor = .gray
        
        movieButton.setTitle("MovieChart로 이동", for: .normal)
        movieButton.setTitleColor(.systemBlue, for: .normal)
        movieButton.addTarget(self, action: #selector(movieButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func movieButtonTapped() {
        let vc = MovieChartViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func numberBackground(_ number: Int) -> UIColor {
        switch number {
        case 1...10:
            return .lotteryYellow
        case 11...20:
            return .lotteryBlue
        case 21...30:
            return .lotteryRed
        default:
            return .lotteryGray
        }
    }
    
    func numberLayout(_ currentLabel: UILabel, to: UILabel) {
        currentLabel.snp.makeConstraints { make in
            make.centerY.equalTo(to.snp.centerY)
            make.leading.equalTo(to.snp.trailing).offset(8)
            make.size.equalTo(40)
        }
    }
    
    func numberDesign(_ label: UILabel, number: Int) {
        label.text = "\(number)"
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = numberBackground(number)
        DispatchQueue.main.async {
            label.layer.cornerRadius = label.frame.height / 2
            label.clipsToBounds = true
        }
    }
    
    func pickerTextFieldConfig() {
        pickerTextField.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
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
