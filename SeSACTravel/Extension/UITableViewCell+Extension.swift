//
//  UITableViewCell+Extension.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/29/24.
//

import UIKit

extension UITableViewCell {
    //Animation when TableView Selected
    func selectionAnimation() {
        if self.isSelected {
            UIView.transition(with: self, duration: 0.5, options: .transitionCrossDissolve) {
                self.setSelected(false, animated: true)
            }
        }
    }
}
