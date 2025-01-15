//
//  ShoppingViewController.swift
//  ShoppingProject
//
//  Created by 조우현 on 1/15/25.
//

import UIKit
import Alamofire

class ShoppingViewController: UIViewController {

    var navTitleContents: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        if let titleText = navTitleContents {
            callRequest(query: titleText)
        }
    }
    
    func configureView() {
        view.backgroundColor = .black
        navigationItem.title = navTitleContents
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func callRequest(query: String) {
        let url = "https://openapi.naver.com/v1/search/shop.json?query=\(query)&display=100"
        let header: HTTPHeaders = [
            
        ]
        
        AF.request(url, method: .get).responseString { response in
            print(response)
        }
    }
}
