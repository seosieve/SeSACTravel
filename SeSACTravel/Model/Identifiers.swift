//
//  Identifiers.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/25/24.
//

import Foundation

enum Identifier {
    case shoppingTableViewCell
    case travelTableViewCell
    case restaurantViewCell
    case CityTableViewCell
    case AdTableViewCell
    case PopularCityTableViewCell
    case CityDetailViewController
    case AdDetailViewController

    var description: String {
        return String(describing: self)
    }
}
