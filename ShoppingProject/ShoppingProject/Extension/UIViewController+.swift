//
//  UIViewController+.swift
//  ShoppingProject
//
//  Created by 조우현 on 1/15/25.
//

import UIKit

// 강의자료 맨 마지막에 클로저 예시 참고해서 수정해보기
// 예를 들어 메인화면의 text를 "검색결과가 없어요"로 바꾼다든지? => 이걸 Alert에서?
extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
