//
//  NPayViewController.swift
//  AutoLayoutProgrammatically
//
//  Created by 조우현 on 1/13/25.
//

import UIKit
import SnapKit

class NPayViewController: UIViewController {

    lazy var selectionSegmentControl = {
        let segmentControl = UISegmentedControl(items: ["멤버십", "현장결제", "쿠폰"])
        segmentControl.selectedSegmentIndex = 1
        segmentControl.selectedSegmentTintColor = .npaySeg
        return segmentControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        essentialDesign()
        segmentControleConfig()
    }
    
    func segmentControleConfig() {
        view.addSubview(selectionSegmentControl)
        
        selectionSegmentControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(14)
            make.horizontalEdges.equalTo(view).inset(24)
            make.height.equalTo(36)
        }
    }
    
    func essentialDesign() {
        view.backgroundColor = .npayBackground
    }
}
