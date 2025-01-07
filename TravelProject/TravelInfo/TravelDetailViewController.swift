//
//  TravelDetailViewController.swift
//  TravelProject
//
//  Created by 조우현 on 1/7/25.
//

import UIKit
import Kingfisher

class TravelDetailViewController: UIViewController {

    
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var popButton: UIButton!
    
    var imageContents: String?
    var titleContents: String?
    var descriptionContents: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "관광지 화면"
        
        imageDesign()
        titleDesign()
        descriptionDesign()
    }
    
    func imageDesign() {
        if let imageContents {
            let url = URL(string: imageContents)
            travelImageView.kf.setImage(with: url)
        } else {
            travelImageView.image = UIImage(systemName: "xmark")
        }
        
        travelImageView.contentMode = .scaleAspectFill
        travelImageView.layer.cornerRadius = 8
    }
    
    func titleDesign() {
        if let titleContents {
            titleLabel.text = titleContents
            titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        } else {
            titleLabel.text = "불러오기 실패"
        }
    }
    
    func descriptionDesign() {
        if let descriptionContents {
            descriptionLabel.text = descriptionContents
            descriptionLabel.font = .systemFont(ofSize: 24, weight: .bold)
            descriptionLabel.numberOfLines = 0
            descriptionLabel.textAlignment = .center
        }
    }
}
