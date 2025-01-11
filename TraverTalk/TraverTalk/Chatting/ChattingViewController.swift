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
    
    var titleContents: String?
    var chatListContents: String?
    var imageContents: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationDesign()
    }
    
    func navigationDesign() {
        navigationItem.title = titleContents
    }
}
