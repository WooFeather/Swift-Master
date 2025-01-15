//
//  ShoppingViewController.swift
//  ShoppingProject
//
//  Created by 조우현 on 1/15/25.
//

import UIKit

class ShoppingViewController: UIViewController {

    var navTitleContents: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    func configureView() {
        view.backgroundColor = .black
        navigationItem.title = navTitleContents
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
