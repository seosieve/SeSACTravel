//
//  UIViewController+Extension.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/30/24.
//

import UIKit

extension UIViewController: ReusableViewProtocol {
    //Automatically Create Identifier
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
