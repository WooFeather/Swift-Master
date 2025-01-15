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
    var navTitleContents: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        if let titleText = navTitleContents {
            callRequest(query: titleText)
        }
        configureCollectionView()
    }
    
    func configureView() {
        view.backgroundColor = .black
        navigationItem.title = navTitleContents
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func configureCollectionView() {
        view.addSubview(shoppingCollectionView)
        
        shoppingCollectionView.delegate = self
        shoppingCollectionView.dataSource = self
        shoppingCollectionView.register(ShoppingCollectionViewCell.self, forCellWithReuseIdentifier: ShoppingCollectionViewCell.id)
        
        // 위에 검색결과와 정렬 들어오면서 변경 예정
        shoppingCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = shoppingCollectionView.dequeueReusableCell(withReuseIdentifier: ShoppingCollectionViewCell.id, for: indexPath) as? ShoppingCollectionViewCell else { return UICollectionViewCell() }
        
        print(#function)
        
        cell.layer.cornerRadius = 8
        cell.layer.borderColor = UIColor.red.cgColor
        cell.layer.borderWidth = 2
        cell.thumbnailImageView.image = UIImage(systemName: "person")
        
        return cell
    }
}
