//
//  ViewConfiguration.swift
//  ShoppingProject
//
//  Created by 조우현 on 1/15/25.
//

import Foundation

protocol ViewConfiguration: AnyObject {
    func configureHierarchy() // addSubView
    func configureLayout() // snapKit
    func configureView() // property
}
