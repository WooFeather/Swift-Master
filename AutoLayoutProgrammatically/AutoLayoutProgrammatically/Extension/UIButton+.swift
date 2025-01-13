//
//  UIButton+.swift
//  AutoLayoutProgrammatically
//
//  Created by 조우현 on 1/13/25.
//

import UIKit

extension UIButton.Configuration {
    static func dropDownButtonStyle() -> UIButton.Configuration {
        var configuration = UIButton.Configuration.plain()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 10)
        configuration.title = "국내"
        configuration.image = UIImage(systemName: "arrowtriangle.down.fill")
        configuration.preferredSymbolConfigurationForImage = imageConfig
        configuration.imagePlacement = .trailing
        configuration.baseForegroundColor = .gray
        return configuration
    }
    
    static func xButtonStyle() -> UIButton.Configuration {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "xmark")
        configuration.baseForegroundColor = .gray
        return configuration
    }
    
    static func selectionButtonStyle() -> UIButton.Configuration {
        var configuration = UIButton.Configuration.plain()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 20)
        configuration.title = "바로결제 사용하기"
        configuration.image = UIImage(systemName: "checkmark.circle.fill")
        configuration.preferredSymbolConfigurationForImage = imageConfig
        configuration.imagePlacement = .leading
        configuration.imagePadding = 0.5
        configuration.image?.withTintColor(.nPayAccent)
        configuration.baseForegroundColor = .black
        return configuration
    }
    
    static func confirmButtonStyle() -> UIButton.Configuration {
        var configuration = UIButton.Configuration.plain()
        configuration.title = "확인"
        configuration.titleAlignment = .center
        configuration.baseForegroundColor = .white
        configuration.background.backgroundColor = .nPayAccent
        configuration.cornerStyle = .capsule
        return configuration
    }
}
