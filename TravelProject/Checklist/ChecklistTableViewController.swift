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
    
    // UserDefaults에 저장해보기
    var checklistItems: [Checklist] = [] {
        didSet {
            // 배열이 변경될때마다 reload
            tableView.reloadData()
            
            let encoder = JSONEncoder()
            if let encodedData = try? encoder.encode(checklistItems) {
                UserDefaults.standard.set(encodedData, forKey: "checklistItems")
                print("success")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let savedData = UserDefaults.standard.object(forKey: "checklistItems") as? Data {
            let decoder = JSONDecoder()
            if let savedObject = try? decoder.decode([Checklist].self, from: savedData) {
                checklistItems = savedObject
            }
        }
        
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
        checklistItems[sender.tag].complete.toggle()
        tableView.reloadData()
    }
    
    @objc func bookmarkButtonTapped(_ sender: UIButton) {
        checklistItems[sender.tag].bookmark.toggle()
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return checklistItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistTableViewCell", for: indexPath) as! ChecklistTableViewCell
        let row = checklistItems[indexPath.row]
        
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.white.cgColor
        cell.backgroundColor = .cellBackground
        
        cell.titleLabel.setChecklistCellLabel(row.title ?? "불러오기 실패")
        
        cell.completeButton.setImage(UIImage(systemName: row.complete ? "checkmark.square.fill" : "checkmark.square"), for: .normal)
        cell.bookmarkButton.setImage(UIImage(systemName: row.bookmark ? "star.fill" : "star"), for: .normal)
        
        cell.completeButton.tag = indexPath.row
        cell.bookmarkButton.tag = indexPath.row
        cell.completeButton.addTarget(self, action: #selector(completeButtonTapped), for: .touchUpInside)
        cell.bookmarkButton.addTarget(self, action: #selector(bookmarkButtonTapped), for: .touchUpInside)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function, indexPath)
        // 수정가능하게 만들어보기
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "삭제") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            print(#function)
            
            self.checklistItems.remove(at: indexPath.row)
        }
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
}
