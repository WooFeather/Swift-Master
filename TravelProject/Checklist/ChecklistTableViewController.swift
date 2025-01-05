//
//  ChecklistTableViewController.swift
//  TravelProject
//
//  Created by 조우현 on 1/3/25.
//

import UIKit

class ChecklistTableViewController: UITableViewController {

    @IBOutlet var textFieldBackground: UIView!
    @IBOutlet var addTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    // 즐겨찾기, 체크여부를 함께 관리하기 위해 클래스로 만들어보기
    // UserDefaults에 저장해보기 => done
    var checklistItems = ChecklistItem().checklists {
        didSet {
            // 배열이 변경될때마다 reload 및 데이터 저장
            tableView.reloadData()
//            UserDefaults.standard.set(checklistItems, forKey: "checklistItems")
//            print(UserDefaults.standard.array(forKey: "checklistItems")!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        checklistItems = UserDefaults.standard.array(forKey: "checklistItems") as? [Checklist] ?? []
        
        // 고정 셀높이
        tableView.rowHeight = 52
        
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
            checklistItems.insert(Checklist(title: text), at: 0)
            addTextField.text = ""
        }
    }
    
    @IBAction func textFieldDidEndOnExit(_ sender: UITextField) {
        addButtonTapped(addButton)
    }
    
    @objc func completeButtonTapped(_ sender: UIButton) {
        checklistItems[sender.tag].complete?.toggle()
        tableView.reloadData()
    }
    
    @objc func bookmarkButtonTapped(_ sender: UIButton) {
        checklistItems[sender.tag].bookmark?.toggle()
        tableView.reloadData()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistTableViewCell", for: indexPath) as! ChecklistTableViewCell
        let row = checklistItems[indexPath.row]
        
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.white.cgColor
        cell.backgroundColor = .cellBackground
        
        cell.titleLabel.setChecklistCellLabel(row.title ?? "불러오기 실패")
        
        if let completeButton = row.complete {
            let image = UIImage(systemName: completeButton ? "checkmark.square.fill" : "checkmark.square")
            cell.completeButton.setImage(image, for: .normal)
        } else {
            cell.completeButton.setImage(UIImage(systemName: "questionmark"), for: .normal)
        }
        
        if let bookmarkButton = row.bookmark {
            let image = UIImage(systemName: bookmarkButton ? "star.fill" : "star")
            cell.bookmarkButton.setImage(image, for: .normal)
        } else {
            cell.completeButton.setImage(UIImage(systemName: "questionmark"), for: .normal)
        }
        
        cell.completeButton.tag = indexPath.row
        cell.bookmarkButton.tag = indexPath.row
        cell.completeButton.addTarget(self, action: #selector(completeButtonTapped), for: .touchUpInside)
        cell.bookmarkButton.addTarget(self, action: #selector(bookmarkButtonTapped), for: .touchUpInside)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function, indexPath)
        
        checklistItems.remove(at: indexPath.row)
    }
}
