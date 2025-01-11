//
//  ChattingViewController.swift
//  TraverTalk
//
//  Created by 조우현 on 1/10/25.
//

import UIKit

class ChattingViewController: UIViewController {

    @IBOutlet var chattingTableView: UITableView!
    @IBOutlet var messageTextView: UITextView!
    @IBOutlet var sendButton: UIButton!
    
    var chatList = ChatInfo().mockChatList
    var chatRoomIdContents: Int?
    var titleContents: String?
    let textViewPlaceholder = "메세지를 입력하세요"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationDesign()
        tableViewConfig()
        textViewConfig()
        sendButtonDesign()
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func navigationDesign() {
        navigationItem.title = titleContents
        
        let chevron = UIImage(systemName: "chevron.left")
        let backButton = (UIBarButtonItem(image: chevron, style: .plain, target: self, action: #selector(backButtonTapped)))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    func textViewConfig() {
        messageTextView.delegate = self
        
        messageTextView.text = textViewPlaceholder
        messageTextView.textColor = .lightGray
        messageTextView.font = .systemFont(ofSize: 17)
        messageTextView.backgroundColor = .systemGray6
        messageTextView.layer.cornerRadius = 8
    }
    
    func sendButtonDesign() {
        sendButton.configuration = .sendButtonStyle()
        sendButton.isEnabled = false
    }
    
    // 스크롤 디폴트를 맨 아래로 내리기? (가장 최근 채팅보이기)
    func tableViewConfig() {
        chattingTableView.delegate = self
        chattingTableView.dataSource = self
        chattingTableView.separatorStyle = .none
        chattingTableView.allowsSelection = false
        
        let leftBubbleXib = UINib(nibName: Identifier.LeftBubbleTableViewCell.rawValue, bundle: nil)
        chattingTableView.register(leftBubbleXib, forCellReuseIdentifier: Identifier.LeftBubbleTableViewCell.rawValue)
        
        let rightBubbleXib = UINib(nibName: Identifier.RightBubbleTableViewCell.rawValue, bundle: nil)
        chattingTableView.register(rightBubbleXib, forCellReuseIdentifier: Identifier.RightBubbleTableViewCell.rawValue)
    }
}

extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let chatRoomIdContents else {
            print("잘못된 접근입니다!")
            return 0
        }
        
        let chatRoomIndex = chatRoomIdContents - 1
        return chatList[chatRoomIndex].chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let chatRoomIdContents else {
            print("잘못된 접근입니다!")
            return UITableViewCell.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        }
        
        let chatRoomIndex = chatRoomIdContents - 1
        let row = chatList[chatRoomIndex].chatList[indexPath.row]
        
        if row.user != .user {
            let cell = chattingTableView.dequeueReusableCell(withIdentifier: Identifier.LeftBubbleTableViewCell.rawValue) as! LeftBubbleTableViewCell
            cell.configureData(row: row)
        
            return cell
        } else {
            let cell = chattingTableView.dequeueReusableCell(withIdentifier: Identifier.RightBubbleTableViewCell.rawValue) as! RightBubbleTableViewCell
            cell.configureData(row: row)
            
            return cell
        }
    }
}

extension ChattingViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        print(#function)
        
        // 플레이스홀더 처리
        if messageTextView.textColor == UIColor.lightGray {
            messageTextView.text = nil
            messageTextView.textColor = UIColor.black
        }
        
        sendButton.isEnabled = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print(#function)
        
        // 플레이스홀더
        if messageTextView.text.isEmpty {
            messageTextView.text = textViewPlaceholder
            messageTextView.textColor = UIColor.lightGray
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        print(#function)
        // 키보드 내리기 코드 -> 연구해보기!
        if text == "\n" {
            messageTextView.resignFirstResponder()
        } else {
            
        }
        return true
    }
}
