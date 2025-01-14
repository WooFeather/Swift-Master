//
//  MovieChartViewController.swift
//  NetworkingProject
//
//  Created by 조우현 on 1/14/25.
//

import UIKit
import SnapKit
import Alamofire

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
    
    let movieTableView = UITableView()
    
    static let apiKey = "04b35f8603fa63738f28b50e8ae94a4d"
    var searchDate = "20250113"

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
        
        movieTableView.snp.makeConstraints { make in
            make.top.equalTo(textFieldBottomLine.snp.bottom).offset(12)
            make.bottom.horizontalEdges.equalToSuperview()
        }
        
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.register(MovieChartTableViewCell.self, forCellReuseIdentifier: MovieChartTableViewCell.identifier)
    }
    
//    func networking() {
//        let url = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=04b35f8603fa63738f28b50e8ae94a4d&targetDt=\(searchDate)"
//        AF.request(url, method: .get).responseString { response in
//            dump(response)
//        }
//    }
}

extension MovieChartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        let cell = movieTableView.dequeueReusableCell(withIdentifier: MovieChartTableViewCell.identifier, for: indexPath) as! MovieChartTableViewCell
        let url = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=04b35f8603fa63738f28b50e8ae94a4d&targetDt=\(searchDate)"
        AF.request(url, method: .get).responseDecodable(of: BoxOffice.self) { response in
            switch response.result {
            case .success(let value):
                let row = value.boxOfficeResult.dailyBoxOfficeList[indexPath.row]
                cell.rankingLabel.text = row.rank
                cell.titleLabel.text = row.movieNm
                cell.releaseDateLabel.text = row.openDt
            case .failure(let error):
                print(error)
            }
        }
        
        cell.backgroundColor = .clear
//        cell.configureData(row: row)
        
        return cell
    }
}
