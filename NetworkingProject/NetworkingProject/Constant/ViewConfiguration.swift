//
//  ViewConfiguration.swift
//  NetworkingProject
//
//  Created by 조우현 on 1/14/25.
//

import Foundation

protocol ViewConfiguration: AnyObject {
    func configureHierarchy() // addSubView
    func configureLayout() // snapKit
    func configureView() // property
}
