//
//  Identifiers.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/25/24.
//

import Foundation

//NewVersion
protocol ReusableViewProtocol {
    static var reuseIdentifier: String { get }
}

//OldVersion
enum Identifier {
    case shoppingTableViewCell
    case travelTableViewCell
    case restaurantViewCell
    case PopularCityTableViewCell

    var description: String {
        return String(describing: self)
    }
}
