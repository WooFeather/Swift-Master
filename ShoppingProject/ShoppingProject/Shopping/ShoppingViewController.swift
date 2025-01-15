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
    
    var list: [Item] = []
    // 네트워킹 -> 변수에 값 할당 -> 그 변수의 값 사용하려고 했는데 실패..
//    var totalCount = 0
    
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
        
        // 네트워킹 -> 변수에 값 할당 -> 그 변수의 값 사용하려고 했는데 실패..
//        resultCountLabel.text = "\(totalCount.numberFormatting() ?? "") 개의 검색 결과"
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
        
        shoppingCollectionView.snp.makeConstraints { make in
            make.top.equalTo(sampleButton.snp.bottom).offset(8)
            make.bottom.horizontalEdges.equalToSuperview()
        }
        
        shoppingCollectionView.backgroundColor = .black
    }
    
    func createCollectionViewLayout() -> UICollectionViewLayout {
        let sectionInset: CGFloat = 10
        let cellSpacing: CGFloat = 10
        
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
        
        AF.request(url, method: .get, headers: header).responseDecodable(of: SearchItem.self) { response in
            switch response.result {
            case .success(let value):
                print("✅ SUCCESS")
                
                // 네트워킹 -> 변수에 값 할당 -> 그 변수의 값 사용하려고 했는데 실패..
//                var countNumber: Int {
//                    get {
//                        self.totalCount
//                    }
//                    set {
//                        self.totalCount = newValue
//                    }
//                }
//                countNumber = value.totalCount
                self.resultCountLabel.text = "\(value.totalCount.numberFormatting() ?? "") 개의 검색 결과"
                self.list = value.items
                self.shoppingCollectionView.reloadData()
            case .failure(let error):
                print("❌ FAILURE \(error)")
            }
        }
    }
}

extension ShoppingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = shoppingCollectionView.dequeueReusableCell(withReuseIdentifier: ShoppingCollectionViewCell.id, for: indexPath) as? ShoppingCollectionViewCell else { return UICollectionViewCell() }
        
        let data = list[indexPath.row]
        cell.configureData(data: data)
        
        return cell
    }
}
