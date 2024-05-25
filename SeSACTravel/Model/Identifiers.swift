//
//  Identifiers.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/25/24.
//

import Foundation

enum CellIdentifier: String, CaseIterable {
    case shoppingTableViewCell
    case travelTableViewCell
    case restaurantViewCell

    var description: String {
        return String(describing: self)
    }
}
