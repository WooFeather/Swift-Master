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
//    var chatListContents: String?
    var imageContents: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationDesign()
        tableViewConfig()
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
    
    func tableViewConfig() {
        chattingTableView.delegate = self
        chattingTableView.dataSource = self
        chattingTableView.separatorStyle = .none
        
        let xib = UINib(nibName: Identifier.LeftBubbleTableViewCell.rawValue, bundle: nil)
        chattingTableView.register(xib, forCellReuseIdentifier: Identifier.LeftBubbleTableViewCell.rawValue)
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
        
//        if row.user != .user {
            let cell = chattingTableView.dequeueReusableCell(withIdentifier: Identifier.LeftBubbleTableViewCell.rawValue) as! LeftBubbleTableViewCell
        cell.nameLabel.text = row.user.rawValue
        cell.profileImage.image = imageContents
        cell.messageLabel.text = row.message
        cell.timeLabel.text = row.date.toDate()?.toTimeString()
        
            return cell
//        } else {
//            // RightBubbleTableViewCell
//        }
    }
}
