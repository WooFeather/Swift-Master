//
//  TravelAdDetailViewController.swift
//  TravelProject
//
//  Created by 조우현 on 1/7/25.
//

import UIKit

class TravelAdDetailViewController: UIViewController {

    @IBOutlet var adTitleLabel: UILabel!
    var titleContents: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationDesign()
        titleDesign()
    }
    
    func navigationDesign() {
        navigationItem.title = "광고 화면"
        
        let xmark = UIImage(systemName: "xmark")
        let closeButton = (UIBarButtonItem(image: xmark, style: .plain, target: self, action: #selector(closeButtonTapped)))
        navigationItem.leftBarButtonItem = closeButton
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    func titleDesign() {
        if let titleContents {
            adTitleLabel.text = titleContents
            adTitleLabel.font = .systemFont(ofSize: 24, weight: .bold)
            adTitleLabel.numberOfLines = 0
            adTitleLabel.textAlignment = .center
        } else {
            adTitleLabel.text = "불러오기 실패"
        }
    }
}
