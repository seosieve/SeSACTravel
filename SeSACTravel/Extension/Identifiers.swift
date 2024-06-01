//
//  Identifiers.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/25/24.
//

import Foundation
import UIKit

//NewVersion
protocol ReusableIdentifierProtocol {
    static var identifier: String { get }
}

//OldVersion
enum Identifier {
    case travelTableViewCell
    case restaurantViewCell
    case PopularCityTableViewCell

    var description: String {
        return String(describing: self)
    }
}
