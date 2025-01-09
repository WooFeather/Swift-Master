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
    var filteredNumberList: [Int] = []
    
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
    
    func selectTargetNumber() {
        targetNumber = numberList.randomElement()
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
        resultButton.backgroundColor = .gray
        resultButton.isEnabled = false
    }
}

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = upDownCollectionView.dequeueReusableCell(withReuseIdentifier: GameCollectionViewCell.identifier, for: indexPath) as! GameCollectionViewCell
        
        cell.numberLabel.text = "\(numberList[indexPath.item])"
        DispatchQueue.main.async {
            cell.cellBackground.layer.cornerRadius = cell.cellBackground.frame.height / 2
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = numberList[indexPath.item]
        selectedNumber = row
        print(selectedNumber ?? 0)
        
        resultButton.isEnabled = true
        resultButton.backgroundColor = .black
    }
}
