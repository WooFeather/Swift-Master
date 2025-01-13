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
    
    lazy var backgroundView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var logoImage = {
        let img = UIImageView()
        img.image = .npayLogo
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    lazy var dropDownButton = {
        let btn = UIButton()
        btn.configuration = .dropDownButtonStyle()
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        essentialDesign()
        segmentControleConfig()
        backgroundViewConfig()
        logoImageConfig()
        dropDownButtonConfig()
    }
    
    func segmentControleConfig() {
        view.addSubview(selectionSegmentControl)
        
        selectionSegmentControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(14)
            make.horizontalEdges.equalTo(view).inset(24)
            make.height.equalTo(36)
        }
    }
    
    func backgroundViewConfig() {
        view.addSubview(backgroundView)
        
        backgroundView.snp.makeConstraints { make in
            make.top.equalTo(selectionSegmentControl.snp.bottom).offset(22)
            make.horizontalEdges.equalTo(view).inset(24)
            make.height.equalTo(450)
        }
    }
    
    func logoImageConfig() {
        backgroundView.addSubview(logoImage)
        
        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(8)
            make.width.equalTo(90)
            make.height.equalTo(40)
        }
    }
    
    func dropDownButtonConfig() {
        backgroundView.addSubview(dropDownButton)
        
        dropDownButton.snp.makeConstraints { make in
            make.centerY.equalTo(logoImage.snp.centerY)
            make.leading.equalTo(logoImage.snp.trailing)
            make.height.equalTo(20)
        }
    }
    
    func essentialDesign() {
        view.backgroundColor = .npayBackground
    }
}
