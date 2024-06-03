//
//  Date+Extension.swift
//  SeSACTravel
//
//  Created by 서충원 on 6/3/24.
//

import Foundation

extension Date {
    func toPreviewString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy.MM.dd"
        formatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        return formatter.string(from: self)
    }
    
    func toChatString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        formatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        formatter.locale = Locale(identifier:"ko_KR")
        return formatter.string(from: self)
    }
    
    func toDayString() -> Int? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        formatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        formatter.locale = Locale(identifier:"ko_KR")
        return Int(formatter.string(from: self))
    }
    
    func toViewString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일"
        formatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        formatter.locale = Locale(identifier:"ko_KR")
        return formatter.string(from: self)
    }
}
