//
//  ViewController.swift
//  AutoLayoutProgrammatically
//
//  Created by 조우현 on 1/13/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    lazy var bongflixButton = {
        let btn = UIButton()
        btn.setTitle("BONGFLIX", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 8
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.red.cgColor
        btn .addTarget(self, action: #selector(bongflixButtonTapped), for: .touchUpInside)
        
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonConfig()
    }
    
    @objc
    func bongflixButtonTapped() {
        print(#function)
        let vc = BongflixViewController()
        present(vc, animated: true)
    }
    
    func buttonConfig() {
        view.addSubview(bongflixButton)
        
        bongflixButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(68)
            make.height.equalTo(50)
        }
    }

}

