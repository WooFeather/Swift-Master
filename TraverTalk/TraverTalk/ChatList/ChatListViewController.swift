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
    lazy var filteredChatList = chatList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationDesign()
        collectionViewConfig()
        searchBarConfig()
    }
    
    func collectionViewConfig() {
        chatListCollectionView.delegate = self
        chatListCollectionView.dataSource = self
        
        let chatListXib = UINib(nibName: Identifier.ChatListCollectionViewCell.rawValue, bundle: nil)
        chatListCollectionView.register(chatListXib, forCellWithReuseIdentifier: Identifier.ChatListCollectionViewCell.rawValue)
        
        let groupChatXib = UINib(nibName: Identifier.GroupChatCollectionViewCell.rawValue, bundle: nil)
        chatListCollectionView.register(groupChatXib, forCellWithReuseIdentifier: Identifier.GroupChatCollectionViewCell.rawValue)
        
        chatListCollectionView.collectionViewLayout = collectionViewLayout()
    }
    
    func navigationDesign() {
        navigationItem.title = "TRAVEL TALK"
    }
    
    func searchBarConfig() {
        chatListSearchBar.delegate = self
        chatListSearchBar.placeholder = "친구 이름을 검색해보세요"
    }
    
    func searchChatList(searchText: String) {
        let text = searchText.trimmingCharacters(in: .whitespaces)
        
        if text.isEmpty {
            filteredChatList = chatList
            chatListCollectionView.reloadData()
        } else {
            filteredChatList = chatList.filter { $0.chatroomName.lowercased().contains(text.lowercased()) }
            chatListCollectionView.reloadData()
        }
    }
}

extension ChatListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchChatList(searchText: searchBar.text ?? "")
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        searchChatList(searchText: searchText)
    }
}

extension ChatListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredChatList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = filteredChatList[indexPath.item]
        
        if item.chatroomImage.count == 1 {
            let cell = chatListCollectionView.dequeueReusableCell(withReuseIdentifier: Identifier.ChatListCollectionViewCell.rawValue, for: indexPath) as! ChatListCollectionViewCell
            
            cell.configureData(item: item)
            
            return cell
        } else {
            let cell = chatListCollectionView.dequeueReusableCell(withReuseIdentifier: Identifier.GroupChatCollectionViewCell.rawValue, for: indexPath) as! GroupChatCollectionViewCell
            
            cell.configureData(item: item)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = filteredChatList[indexPath.item]
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: Identifier.ChattingViewController.rawValue) as! ChattingViewController
        vc.titleContents = item.chatroomName
        vc.chatRoomIdContents = item.chatroomId
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
