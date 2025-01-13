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
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.red.cgColor
        btn.addTarget(self, action: #selector(bongflixButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var nPayButton = {
        let btn = UIButton()
        btn.setTitle("NPay", for: .normal)
        btn.backgroundColor = .green
        btn.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(nPayButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var movieChartButton = {
        let btn = UIButton()
        btn.setTitle("MovieChart", for: .normal)
        btn.backgroundColor = .blue
        DispatchQueue.main.async {
            btn.layer.cornerRadius = btn.frame.width / 2
        }
        btn.addTarget(self, action: #selector(movieChartButtonTapped), for: .touchUpInside)
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
    
    @objc
    func nPayButtonTapped() {
        print(#function)
        let vc = NPayViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func movieChartButtonTapped() {
        print(#function)
        let vc = MovieChartViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func buttonConfig() {
        view.addSubview(bongflixButton)
        view.addSubview(nPayButton)
        view.addSubview(movieChartButton)
        
        bongflixButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(68)
            make.height.equalTo(50)
        }
        
        nPayButton.snp.makeConstraints { make in
            make.top.equalTo(bongflixButton.snp.bottom).offset(44)
            make.centerX.equalTo(bongflixButton.snp.centerX)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        movieChartButton.snp.makeConstraints { make in
            make.top.equalTo(nPayButton.snp.bottom).offset(44)
            make.centerX.equalToSuperview()
            make.size.equalTo(150)
        }
    }
}

