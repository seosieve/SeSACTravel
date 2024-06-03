//
//  String+Extenstion.swift
//  SeSACTravel
//
//  Created by 서충원 on 6/3/24.
//

import Foundation

extension String {
    func toDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        if let date = formatter.date(from: self) {
            return date
        } else {
            return nil
        }
    }
}
