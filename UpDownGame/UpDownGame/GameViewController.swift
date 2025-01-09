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
    
    var selectedNumber: Int?
    var guideText: String = "UP DOWN"
    var tryCount: Int = 0
    var tryCountText: String {
        "시도 횟수: \(tryCount)"
    }
    lazy var numberList: [Int] = Array(1...(selectedNumber ?? 1))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("선택한 숫자: \(selectedNumber!)")
        
        view.backgroundColor = .main
        guideLabelDesign()
        tryCountLabelDesign()
        resultButtonDesign()
        collectionViewConfig()
        upDownCollectionViewLayout()
    }
    
    func collectionViewConfig() {
        upDownCollectionView.delegate = self
        upDownCollectionView.dataSource = self
        
        let id = GameCollectionViewCell.identifier
        let xib = UINib(nibName: id, bundle: nil)
        upDownCollectionView.register(xib, forCellWithReuseIdentifier: id)
    }
    
    func upDownCollectionViewLayout() {
        upDownCollectionView.backgroundColor = .main
//        upDownCollectionView.collectionViewLayout =
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
        resultButton.backgroundColor = .black
    }
}

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = upDownCollectionView.dequeueReusableCell(withReuseIdentifier: GameCollectionViewCell.identifier, for: indexPath) as! GameCollectionViewCell
        
        cell.numberLabel.text = "\(numberList[indexPath.row])"
        
        return cell
    }
}
