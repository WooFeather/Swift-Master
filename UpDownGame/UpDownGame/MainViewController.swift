//
//  ViewController.swift
//  UpDownGame
//
//  Created by 조우현 on 1/9/25.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var mainImageConstraint: NSLayoutConstraint!
    
    let mainImageList: [UIImage] = [.emotion1, .emotion2, .emotion3, .emotion4, .emotion5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .main
        titleLabelDesign()
        subtitleLabelDesign()
        numberTextFieldDesign()
        startButtonDesign()
//        mainImageTopConstraintConfig()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mainImageDesign()
        numberTextField.text = ""
    }
    
    @IBAction func numberTextFieldDidEndOnExit(_ sender: UITextField) {}
    
    @IBAction func EndEditingTapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        let text = numberTextField.text!.trimmingCharacters(in: .whitespaces)
        
        if let textNum = Int(text) {
            if textNum < 1 || textNum > 100 {
                showAlert(title: "다시 확인해주세요😭", message: "1~100까지의 숫자를 입력해주세요.")
                numberTextField.text = ""
            } else {
                vc.maxNumber = textNum
                navigationController?.pushViewController(vc, animated: true)
            }
        } else {
            showAlert(title: "다시 확인해주세요😭", message: "숫자가 아닌 문자나 공백은 입력할 수 없습니다.")
            numberTextField.text = ""
        }
    }
    
    // 이런식으로 제약사항을 0으로 만들어서 뷰를 위로 올려보려고 했는데 실패했습니다. 사용방법 좀더 알아보기!
//    func mainImageTopConstraintConfig() {
//        if numberTextField.isEditing {
//            mainImageConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: subTitleLabel, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
//        }
//    }
    
    func titleLabelDesign() {
        titleLabel.text = "UP DOWN"
        titleLabel.font = .systemFont(ofSize: 50, weight: .heavy)
        titleLabel.textAlignment = .center
    }
    
    func subtitleLabelDesign() {
        subTitleLabel.text = "GAME"
        subTitleLabel.font = .systemFont(ofSize: 20, weight: .regular)
        subTitleLabel.textColor = .gray
        subTitleLabel.textAlignment = .center
    }
    
    func mainImageDesign() {
        mainImageView.image = mainImageList.randomElement()
        mainImageView.contentMode = .scaleAspectFill
    }
    
    func numberTextFieldDesign() {
        numberTextField.placeholder = "최대 숫자를 입력하세요"
        numberTextField.font = .systemFont(ofSize: 30, weight: .bold)
        numberTextField.textAlignment = .center
        numberTextField.borderStyle = .none
        numberTextField.keyboardType = .decimalPad
    }
    
    func startButtonDesign() {
        startButton.setTitle("시작하기", for: .normal)
        startButton.tintColor = .white
        startButton.backgroundColor = .black
    }
}
