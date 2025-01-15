//
//  MainViewController.swift
//  ShoppingProject
//
//  Created by 조우현 on 1/15/25.
//

import UIKit
import Alamofire
import SnapKit

class MainViewController: UIViewController {
    
    let shoppingSearchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureSearchBar()
    }
    
    func configureView() {
        view.backgroundColor = .black
        navigationItem.title = "도봉러의 쇼핑쇼핑"
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func configureSearchBar() {
        view.addSubview(shoppingSearchBar)
        
        shoppingSearchBar.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        shoppingSearchBar.tintColor = .white
        shoppingSearchBar.barTintColor = .black
        shoppingSearchBar.searchTextField.textColor = .white
        shoppingSearchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
    }
}
