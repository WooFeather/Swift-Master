//
//  MovieChartViewController.swift
//  AutoLayoutProgrammatically
//
//  Created by 조우현 on 1/14/25.
//

import UIKit
import SnapKit

class MovieChartViewController: UIViewController {
    
    lazy var backgroundImage = {
        let img = UIImageView()
        img.image = .film
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    lazy var dimmingView = {
        let view = UIImageView()
        view.backgroundColor = .black
        // view.alpha = 0.7
        view.layer.opacity = 0.7
        return view
    }()
    
    lazy var searchTextField = {
        let txt = UITextField()
        txt.placeholder = "영화 정보를 검색하세요"
        txt.textColor = .white
        txt.setColor(.systemGray3)
        txt.borderStyle = .none
        txt.addTarget(self, action: #selector(textFieldDidEndOnExit), for: .editingDidEndOnExit)
        return txt
    }()
    
    lazy var textFieldBottomLine = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var searchButton = {
        let btn = UIButton()
        btn.setTitle("검색", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageConfig()
        searchTextFieldConfig()
        searchButtonConfig()
    }
    
    @objc
    func textFieldDidEndOnExit() {
        view.endEditing(true)
    }

    func backgroundImageConfig() {
        view.addSubview(backgroundImage)
        view.addSubview(dimmingView)
        
        [backgroundImage, dimmingView].forEach {
            $0.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
    }
    
    func searchTextFieldConfig() {
        view.addSubview(searchTextField)
        view.addSubview(textFieldBottomLine)
        
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.leading.equalTo(view).offset(24)
            make.width.equalTo(250)
        }
        
        textFieldBottomLine.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(8)
            make.leading.equalTo(view).offset(24)
            make.width.equalTo(250)
            make.height.equalTo(2)
        }
    }
    
    func searchButtonConfig() {
        view.addSubview(searchButton)
        
        searchButton.snp.makeConstraints { make in
            make.centerY.equalTo(searchTextField.snp.centerY)
            make.leading.equalTo(searchTextField.snp.trailing).offset(12)
            make.trailing.equalTo(view).offset(-24)
            make.height.equalTo(50)
        }
    }
}
