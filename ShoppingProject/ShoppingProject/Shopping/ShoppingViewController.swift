//
//  ShoppingViewController.swift
//  ShoppingProject
//
//  Created by 조우현 on 1/15/25.
//

import UIKit
import Alamofire
import SnapKit

class ShoppingViewController: UIViewController {

    lazy var shoppingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionViewLayout())
    let resultCountLabel = UILabel()
    let sampleButton = UIButton()
    var navTitleContents: String?
    
    // 네트워킹 이후 삭제 예정
    let sampleCount = 13235449
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        if let titleText = navTitleContents {
            callRequest(query: titleText)
        }
        configureResultCountLabel()
        configureSampleButton()
        configureCollectionView()
    }
    
    func configureView() {
        view.backgroundColor = .black
        navigationItem.title = navTitleContents
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func configureResultCountLabel() {
        view.addSubview(resultCountLabel)
        
        resultCountLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.horizontalEdges.equalTo(view).inset(12)
            make.height.equalTo(17)
        }
        
        // 네트워킹 이후 수정 예정
        if let count = sampleCount.numberFormatting() {
            resultCountLabel.text = "\(count) 개의 검색 결과"
        }
        resultCountLabel.font = .boldSystemFont(ofSize: 15)
        resultCountLabel.textColor = .green
    }
    
    // 다른뷰 레이아웃잡기위함 추후 커스텀뷰로 뺄 예정
    func configureSampleButton() {
        view.addSubview(sampleButton)
        
        sampleButton.snp.makeConstraints { make in
            make.top.equalTo(resultCountLabel.snp.bottom).offset(10)
            make.leading.equalTo(view).offset(12)
            make.height.equalTo(36)
        }
        
        sampleButton.setTitle("정확도    ", for: .normal)
        sampleButton.titleLabel?.textAlignment = .center
        sampleButton.setTitleColor(.white, for: .normal)
        sampleButton.layer.borderColor = UIColor.white.cgColor
        sampleButton.layer.borderWidth = 1
        sampleButton.layer.cornerRadius = 8
    }
    
    func configureCollectionView() {
        view.addSubview(shoppingCollectionView)
        
        shoppingCollectionView.delegate = self
        shoppingCollectionView.dataSource = self
        shoppingCollectionView.register(ShoppingCollectionViewCell.self, forCellWithReuseIdentifier: ShoppingCollectionViewCell.id)
        
        // 위에 검색결과와 정렬 들어오면서 변경 예정
        shoppingCollectionView.snp.makeConstraints { make in
            make.top.equalTo(sampleButton.snp.bottom).offset(8)
            make.bottom.horizontalEdges.equalToSuperview()
        }
        
        shoppingCollectionView.backgroundColor = .black
    }
    
    func createCollectionViewLayout() -> UICollectionViewLayout {
        let sectionInset: CGFloat = 16
        let cellSpacing: CGFloat = 16
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let deviceWidth = UIScreen.main.bounds.width
        let cellWidth = deviceWidth - (sectionInset * 2) - (cellSpacing)
        
        layout.itemSize = CGSize(width: cellWidth / 2, height: (cellWidth / 2) * 1.5)
        layout.sectionInset = UIEdgeInsets(top: sectionInset, left: sectionInset, bottom: sectionInset, right: sectionInset)
        return layout
    }
    
    func callRequest(query: String) {
        let url = "https://openapi.naver.com/v1/search/shop.json?query=\(query)&display=100"
        let header: HTTPHeaders = [
            "X-Naver-Client-Id": APIKey.naverId,
            "X-Naver-Client-Secret": APIKey.naverSecret
        ]
        
        AF.request(url, method: .get, headers: header).responseString { response in
            print(response)
        }
    }
}

extension ShoppingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100  // 네트워킹 이후 수정 예정
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = shoppingCollectionView.dequeueReusableCell(withReuseIdentifier: ShoppingCollectionViewCell.id, for: indexPath) as? ShoppingCollectionViewCell else { return UICollectionViewCell() }
        
        print(#function)
        
        // 네트워킹 이후 수정 예정
        cell.layer.cornerRadius = 8
        cell.layer.borderColor = UIColor.red.cgColor
        cell.layer.borderWidth = 2
        
        return cell
    }
}
