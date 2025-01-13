//
//  MovieChartViewController.swift
//  AutoLayoutProgrammatically
//
//  Created by 조우현 on 1/14/25.
//

import UIKit
import SnapKit

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
        // view.alpha = 0.7
        view.layer.opacity = 0.7
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageConfig()
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
}
