//
//  UIViewController+Extension.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/30/24.
//

import UIKit

extension UIViewController: ReusableIdentifierProtocol {
    //Automatically Create Identifier
    static var identifier: String {
        return String(describing: self)
    }
}
