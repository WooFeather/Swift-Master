//
//  MainViewController.swift
//  ShoppingProject
//
//  Created by 조우현 on 1/15/25.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let shoppingSearchBar = UISearchBar()
    let mainImageView = UIImageView()
    let mainLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureSearchBar()
        configureImageView()
        configureMainLabel()
    }
    
    func configureView() {
        view.backgroundColor = .black
        navigationItem.title = "도봉러의 쇼핑쇼핑"
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func configureSearchBar() {
        view.addSubview(shoppingSearchBar)
        shoppingSearchBar.delegate = self
        
        shoppingSearchBar.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        shoppingSearchBar.tintColor = .white
        shoppingSearchBar.barTintColor = .black
        shoppingSearchBar.searchTextField.textColor = .white
        shoppingSearchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
    }
    
    func configureImageView() {
        view.addSubview(mainImageView)
        
        mainImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(300)
            make.width.equalTo(200)
        }
        
        mainImageView.image = .shoppingMain
        mainImageView.contentMode = .scaleAspectFill
    }
    
    func configureMainLabel() {
        view.addSubview(mainLabel)
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(21)
        }
        
        mainLabel.text = "쇼핑하구팡"
        mainLabel.font = .boldSystemFont(ofSize: 17)
        mainLabel.textColor = .white
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        guard let searchText = searchBar.text else {
            // 텍스트가 없을 경우 return버튼이 비활성화되긴 함
            print("텍스트가 nil이당")
            return
        }
        
        let trimmingText = searchText.trimmingCharacters(in: .whitespaces)
        
        // 유효성검사(2글자 이상), 뷰전환(push), 값전달
        if trimmingText.count < 2 {
            showAlert(title: "검색어를 다시 확인해주세요😭", message: "검색어는 2글자 이상이어야 합니다.")
        } else {
            let vc = ShoppingViewController()
            navigationController?.pushViewController(vc, animated: true)
            vc.navTitleContents = trimmingText
        }
        
        view.endEditing(true)
    }
}
