//
//  GameViewController.swift
//  UpDownGame
//
//  Created by 조우현 on 1/9/25.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var guideLabel: UILabel!
    @IBOutlet var tryCountLabel: UILabel!
    @IBOutlet var upDownCollectionView: UICollectionView!
    @IBOutlet var resultButton: UIButton!
    
    var maxNumber: Int?
    var targetNumber: Int?
    var selectedNumber: Int?
    var guideText: String = "UP DOWN"
    var tryCount: Int = 0
    var tryCountText: String {
        "시도 횟수: \(tryCount)"
    }
    lazy var numberList: [Int] = Array(1...(maxNumber ?? 1))
    lazy var filteredNumberList: [Int] = numberList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("최대 숫자: \(maxNumber ?? 0)")
        
        view.backgroundColor = .main
        guideLabelDesign()
        tryCountLabelDesign()
        resultButtonDesign()
        collectionViewConfig()
        upDownCollectionViewLayout()
        selectTargetNumber()
    }
    
    @IBAction func resultButtonTapped(_ sender: UIButton) {
        print(#function)
        // selectedNumber와 targetNumber를 비교해서 TargetNumber가 SelectedNumber에 비해 Up인지 Down인지 판단
        // 만약 Up이라면 selectedNumber 미만의 numberList 항목들을 제외한 항목들을 filteredNumberList에 담고 filteredNumberList를 기준으로 CollectionView reload
        // guideLabel에 UP이라고 표시하고 tryCount += 1
        // 만약 Down이라면 selectedNumber 초과의 numberList 항목들을 제외한 항목들을 filteredNumberList에 담고 filteredNumberList를 기준으로 CollectionView reload
        // guideLabel에 DOWN이라고 표시하고 tryCount += 1
        // 만약 selectedNumber와 targetNumber가 일치한다면 guideLabel에 GOOD!표시하고 tryCount += 1 및 Alert표시(메인으로 돌아갈 수 있게)
        
        guard let targetNumber, let selectedNumber else {
            print("옵셔널 반환 실패!")
            return
        }
        
        if targetNumber > selectedNumber {
            print("UP!")
            guideText = "UP"
            tryCount += 1
            
            filteredNumberList = tryCount == 0 ? numberList.filter { $0 > selectedNumber } : filteredNumberList.filter { $0 > selectedNumber }
            upDownCollectionView.reloadData()
            componentsReDesign()
        } else if targetNumber < selectedNumber {
            print("DOWN!")
            guideText = "DOWN"
            tryCount += 1
            
            filteredNumberList = tryCount == 0 ? numberList.filter { $0 < selectedNumber } : filteredNumberList.filter { $0 < selectedNumber }
            upDownCollectionView.reloadData()
            componentsReDesign()
        } else {
            print("GOOD!")
            guideText = "GOOD"
            tryCount += 1
        }
    }
    
    // 라벨에 바뀐 데이터 적용 진짜 이게 최선..?
    func componentsReDesign() {
        guideLabelDesign()
        tryCountLabelDesign()
        resultButton.buttonDisable()
    }
    
    func selectTargetNumber() {
        targetNumber = filteredNumberList.randomElement()
        print("타겟넘버: \(targetNumber ?? 0)")
    }
    
    func collectionViewConfig() {
        upDownCollectionView.delegate = self
        upDownCollectionView.dataSource = self
        upDownCollectionView.allowsMultipleSelection = false
        
        let id = GameCollectionViewCell.identifier
        let xib = UINib(nibName: id, bundle: nil)
        upDownCollectionView.register(xib, forCellWithReuseIdentifier: id)
    }
    
    func upDownCollectionViewLayout() {
        let sectionInset: CGFloat = 16
        let cellSpacing: CGFloat = 16
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cellHeight = upDownCollectionView.frame.height - (sectionInset * 2) - (cellSpacing * 4)
        
        layout.itemSize = CGSize(width: cellHeight / 5, height: cellHeight / 5)
        layout.sectionInset = UIEdgeInsets(top: sectionInset, left: sectionInset, bottom: sectionInset, right: sectionInset)
        
        upDownCollectionView.collectionViewLayout = layout
        upDownCollectionView.showsHorizontalScrollIndicator = false
        upDownCollectionView.backgroundColor = .main
    }
    
    func guideLabelDesign() {
        guideLabel.text = guideText
        guideLabel.font = .systemFont(ofSize: 50, weight: .heavy)
        guideLabel.textAlignment = .center
    }
    
    func tryCountLabelDesign() {
        tryCountLabel.text = tryCountText
        tryCountLabel.font = .systemFont(ofSize: 20, weight: .regular)
        tryCountLabel.textAlignment = .center
    }
    
    func resultButtonDesign() {
        resultButton.setTitle("결과 확인하기", for: .normal)
        resultButton.tintColor = .white
        resultButton.buttonDisable()
    }
}

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredNumberList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = upDownCollectionView.dequeueReusableCell(withReuseIdentifier: GameCollectionViewCell.identifier, for: indexPath) as! GameCollectionViewCell
        
        cell.numberLabel.text = "\(filteredNumberList[indexPath.item])"
        DispatchQueue.main.async {
            cell.cellBackground.layer.cornerRadius = cell.cellBackground.frame.height / 2
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = filteredNumberList[indexPath.item]
        selectedNumber = row
        print(selectedNumber!)
        
        resultButton.buttonEnable()
    }
}
