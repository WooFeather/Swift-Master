//
//  UIButton+Extension.swift
//  TraverTalk
//
//  Created by 조우현 on 1/12/25.
//

import UIKit

extension UIButton.Configuration {
    static func sendButtonStyle() -> UIButton.Configuration {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "paperplane")
        
        return configuration
    }
}
