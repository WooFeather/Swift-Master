//
//  ChecklistTableViewController.swift
//  TravelProject
//
//  Created by 조우현 on 1/3/25.
//

import UIKit

class ChecklistTableViewController: UITableViewController {

    @IBOutlet var headerLabel: UILabel!
    @IBOutlet var textFieldBackground: UIView!
    @IBOutlet var addTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    // 즐겨찾기, 체크여부를 함께 관리하기 위해 클래스로 만들어보기
    // UserDefaults에 저장해보기 => done
    var checklistItems: [String] = [] {
        didSet {
            // 배열이 변경될때마다 reload 및 데이터 저장
            tableView.reloadData()
            UserDefaults.standard.set(checklistItems, forKey: "checklistItems")
            print(UserDefaults.standard.array(forKey: "checklistItems")!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        checklistItems = UserDefaults.standard.array(forKey: "checklistItems") as? [String] ?? []
        
        // 고정 셀높이
        tableView.rowHeight = 52
        
        headerLabelDesign()
        textFieldDesign()
        addButtonDesign()
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        
        let text = addTextField.text!.trimmingCharacters(in: .whitespaces)
        
        if text.isEmpty {
            let alert = UIAlertController(title: "추가실패!", message: "내용을 입력하세요", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
        } else {
            checklistItems.append(text)
            addTextField.text = ""
        }
    }
    
    @IBAction func textFieldDidEndOnExit(_ sender: UITextField) {
        addButtonTapped(addButton)
    }
    
    func headerLabelDesign() {
        headerLabel.text = "쇼핑"
        headerLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    
    func textFieldDesign() {
        textFieldBackground.backgroundColor = .cellBackground
        addTextField.placeholder = "무엇을 구매하실 건가요?"
        addTextField.borderStyle = .none
        addTextField.returnKeyType = .done
    }
    
    func addButtonDesign() {
        addButton.setTitle("추가", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.backgroundColor = .systemGray5
        addButton.layer.cornerRadius = 10
    }
    
    // 셀 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return checklistItems.count
    }
    
    // 셀 디자인 및 데이터처리
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "checklistCell")!
        
        // 체크박스, 즐겨찾기 추가해보기
        cell.textLabel?.setChecklistCellLabel(checklistItems[indexPath.row])
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.white.cgColor
        cell.backgroundColor = .cellBackground
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function, indexPath)
        
        checklistItems.remove(at: indexPath.row)
    }
}
