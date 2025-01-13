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
        configuration.title = "국내"
        configuration.image = UIImage(systemName: "chevron.down")
        configuration.imagePlacement = .leading
        configuration.baseForegroundColor = .gray
        return configuration
    }
}
