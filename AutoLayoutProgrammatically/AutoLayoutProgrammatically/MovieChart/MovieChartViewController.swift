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
    
    lazy var movieTableView = UITableView(frame: .zero)
    
    let movieList = MovieData().movieList

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageConfig()
        searchTextFieldConfig()
        searchButtonConfig()
        movieTableViewConfig()
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
            make.height.equalTo(3)
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
    
    func movieTableViewConfig() {
        view.addSubview(movieTableView)
        
        movieTableView.backgroundColor = .clear
        
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.register(MovieChartTableViewCell.self, forCellReuseIdentifier: MovieChartTableViewCell.identifier)
        
        movieTableView.snp.makeConstraints { make in
            make.top.equalTo(textFieldBottomLine.snp.bottom).offset(12)
            make.horizontalEdges.equalTo(view).inset(24)
            make.bottom.equalToSuperview()
        }
    }
}

extension MovieChartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: MovieChartTableViewCell.identifier, for: indexPath) as! MovieChartTableViewCell
        return cell
    }
}
