//
//  ChatListViewController.swift
//  TraverTalk
//
//  Created by 조우현 on 1/10/25.
//

import UIKit

class ChatListViewController: UIViewController {
    
    @IBOutlet var chatListCollectionView: UICollectionView!
    @IBOutlet var chatListSearchBar: UISearchBar!
    
    var chatList = ChatInfo().mockChatList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationDesign()
        collectionViewConfig()
        collectionViewLayoutConfig()
    }
    
    func collectionViewConfig() {
        chatListCollectionView.delegate = self
        chatListCollectionView.dataSource = self
        
        let xib = UINib(nibName: "ChatListCollectionViewCell", bundle: nil)
        chatListCollectionView.register(xib, forCellWithReuseIdentifier: "ChatListCollectionViewCell")
    }
    
    func collectionViewLayoutConfig() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 80)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        chatListCollectionView.collectionViewLayout = layout
    }
    
    func navigationDesign() {
        navigationItem.title = "TRAVEL TALK"
    }
    
}

extension ChatListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = chatListCollectionView.dequeueReusableCell(withReuseIdentifier: "ChatListCollectionViewCell", for: indexPath) as! ChatListCollectionViewCell
        let row = chatList[indexPath.row]
        
        cell.chatRoomImage.image = UIImage(named: row.chatroomImage.first ?? "")
        cell.chatRoomTitleLabel.text = row.chatroomName
        cell.chatRoomPreviewLabel.text = row.chatList.last?.message
        cell.dateLabel.text = row.chatList.last?.date
        
        return cell
    }
}
