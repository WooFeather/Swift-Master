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
    
    let accuracyButton = SortButton(title: "정확도")
    let dateButton = SortButton(title: "날짜순")
    let highPriceButton = SortButton(title: "가격높은순")
    let lowPriceButton = SortButton(title: "가격낮은순")
    
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
        configureButtons()
        configureCollectionView()
        
        accuracyButton.isSelected = true
    }
    
    @objc
    func accuracyButtonTapped() {
        print(#function)
        // 이부분도 단순화 할수있을거같은데
        accuracyButton.isSelected = true
        dateButton.isSelected = false
        highPriceButton.isSelected = false
        lowPriceButton.isSelected = false
        
        // 옵셔널처리도 살짝 아쉽다..
        if let titleText = navTitleContents {
            callRequest(query: titleText, sort: .sim)
        }
    }
    
    @objc
    func dateButtonTapped() {
        print(#function)
        accuracyButton.isSelected = false
        dateButton.isSelected = true
        highPriceButton.isSelected = false
        lowPriceButton.isSelected = false
        
        if let titleText = navTitleContents {
            callRequest(query: titleText, sort: .date)
        }
    }
    
    @objc
    func highPriceButtonTapped() {
        print(#function)
        accuracyButton.isSelected = false
        dateButton.isSelected = false
        highPriceButton.isSelected = true
        lowPriceButton.isSelected = false
        
        if let titleText = navTitleContents {
            callRequest(query: titleText, sort: .dsc)
        }
    }
    
    @objc
    func lowPriceButtonTapped() {
        print(#function)
        accuracyButton.isSelected = false
        dateButton.isSelected = false
        highPriceButton.isSelected = false
        lowPriceButton.isSelected = true
        
        if let titleText = navTitleContents {
            callRequest(query: titleText, sort: .asc)
        }
    }
    
    @objc
    func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func configureView() {
        view.backgroundColor = .black
        navigationItem.title = navTitleContents
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let chevron = UIImage(systemName: "chevron.left")
        let backButton = (UIBarButtonItem(image: chevron, style: .plain, target: self, action: #selector(backButtonTapped)))
        navigationItem.leftBarButtonItem = backButton
        navigationController?.navigationBar.tintColor = .white
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
    
    func configureButtons() {
        let buttons = [accuracyButton, dateButton, highPriceButton, lowPriceButton]
        buttons.forEach { view.addSubview($0) }
        
        for i in 0..<buttons.count {
            if i == 0 {
                buttons[i].snp.makeConstraints { make in
                    make.top.equalTo(resultCountLabel.snp.bottom).offset(10)
                    make.leading.equalTo(view).offset(12)
                    make.height.equalTo(36)
                }
            } else {
                buttons[i].snp.makeConstraints { make in
                    make.top.equalTo(resultCountLabel.snp.bottom).offset(10)
                    make.leading.equalTo(buttons[i - 1].snp.trailing).offset(8)
                    make.height.equalTo(36)
                }
            }
        }
        
        // 뭔가... selector함수도 하나로 만들어서 그 안에서 분기처리를 할 순 없을까?
        accuracyButton.addTarget(self, action: #selector(accuracyButtonTapped), for: .touchUpInside)
        dateButton.addTarget(self, action: #selector(dateButtonTapped), for: .touchUpInside)
        highPriceButton.addTarget(self, action: #selector(highPriceButtonTapped), for: .touchUpInside)
        lowPriceButton.addTarget(self, action: #selector(lowPriceButtonTapped), for: .touchUpInside)
    }
    
    func configureCollectionView() {
        view.addSubview(shoppingCollectionView)
        
        shoppingCollectionView.delegate = self
        shoppingCollectionView.dataSource = self
        shoppingCollectionView.register(ShoppingCollectionViewCell.self, forCellWithReuseIdentifier: ShoppingCollectionViewCell.id)
        
        shoppingCollectionView.snp.makeConstraints { make in
            make.top.equalTo(accuracyButton.snp.bottom).offset(8)
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
    
    func callRequest(query: String, sort: RequestSort = .sim) {
        let url = "https://openapi.naver.com/v1/search/shop.json?query=\(query)&display=100&sort=\(sort)"
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
