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
}
