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
        txt.placeholder = "일자를 검색하세요(YYYYMMDD)"
        txt.keyboardType = .numberPad
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
        btn.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    let movieTableView = UITableView()
    
    static let apiKey = "04b35f8603fa63738f28b50e8ae94a4d"
    lazy var searchDate: String = dateCalculate()
    var rowCount = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageConfig()
        searchTextFieldConfig()
        searchButtonConfig()
        movieTableViewConfig()
        print("어제 날짜: \(searchDate)")
    }
    
    @objc
    func searchButtonTapped() {
        guard let text = searchTextField.text else { return }
        
        if let dateNum = Int(text) {
            if dateNum < 20050101 || dateNum >= Int(Date().toString()) ?? 20300000 {
                showAlert(title: "날짜를 다시 확인해주세요😭", message: "20050101 이후부터 어제 날짜까지 검색이 가능합니다.")
                searchTextField.text = ""
            } else {
                searchDate = text
                movieTableView.reloadData()
            }
        } else {
            showAlert(title: "다시 확인해주세요😭", message: "숫자가 아닌 문자나 공백은 입력할 수 없습니다.")
            searchTextField.text = ""
        }
        // 이상한 날짜일때(ex. 20059984)도 처리해줘야 함..
        // String으로 해서 각 인덱스에 조건을 달아줘야하나..
        // 당연히 문자열의 숫자 크기비교는 안되고, Int의 index를 알지도 모다니.. 좀더 알아봐야 할듯
//        if text[0] != 2 || text[1] != 0 || text[2] > 2 || text[4] > 2 || text[6] > 3 {
//            showAlert(title: "날짜를 다시 확인해주세요😭", message: "20050101 이후부터 어제 날짜까지 검색이 가능합니다.")
//            searchTextField.text = ""
//        } else {
//            searchDate = text
//            movieTableView.reloadData()
//        }
        view.endEditing(true)
    }
    
    @objc
    func textFieldDidEndOnExit() {
        view.endEditing(true)
    }
    
    func dateCalculate() -> String {
        let now = Date()
        let calendar = Calendar.current
        
        let day = DateComponents(day: -1)
        if let yesterday = calendar.date(byAdding: day, to: now) {
            let dateString = yesterday.toString()
            return dateString
        }
        return ""
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
    
    // rowNum을 계산해주기 위한 함수
//    func countRowNum() {
//        let url = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=04b35f8603fa63738f28b50e8ae94a4d&targetDt=\(searchDate)"
//        AF.request(url, method: .get).responseDecodable(of: BoxOffice.self) { [self] response in
//            switch response.result {
//            case .success(let value):
//                rowCount = value.boxOfficeResult.dailyBoxOfficeList.count
//                print("새로 계산된 rowNum\(rowCount)")
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
    // 네트워킹 확인을 위한 함수
//    func networking() {
//        let url = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=04b35f8603fa63738f28b50e8ae94a4d&targetDt=\(searchDate)"
//        AF.request(url, method: .get).responseString { response in
//            dump(response)
//        }
//    }
}

extension MovieChartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 검색버튼을 누르면, 서버에서 받아온 데이터의 개수만큼 생성하려했는데, 얘가 먼저 실행이되서 실패..
        // 아마 비동기처리를 해야될듯..?
        // 일단 입력 예외처리를 통해 인덱스가 rownum이 10보다 낮은 데이터에 접근하지 못하게 해놨습니다.
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        let cell = movieTableView.dequeueReusableCell(withIdentifier: MovieChartTableViewCell.identifier, for: indexPath) as! MovieChartTableViewCell
        let url = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=04b35f8603fa63738f28b50e8ae94a4d&targetDt=\(searchDate)"
        AF.request(url, method: .get).responseDecodable(of: BoxOffice.self) { response in
            switch response.result {
            case .success(let value):
                let row = value.boxOfficeResult.dailyBoxOfficeList[indexPath.row]
                cell.configureData(row: row)
            case .failure(let error):
                print(error)
            }
        }
        
        cell.backgroundColor = .clear
        
        return cell
    }
}
