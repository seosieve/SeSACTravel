//
//  ShoppingModel.swift
//  SeSACTravel
//
//  Created by 서충원 on 6/1/24.
//

import Foundation

struct Shopping: Codable {
    let title: String
    var finished: Bool = false
    var favorited: Bool = false
}

//MARK: - UserDefaultsManager
class UserDefaultsManager {
    private static let userDefault = UserDefaults.standard
    
    private init() { }
    
    static func set(_ value: Shopping, key: String) {
        let encoder = PropertyListEncoder()
        let data = try? encoder.encode(value)
        userDefault.set(data, forKey: key)
    }
    
    static func get(key: String) -> Shopping? {
        let decoder = PropertyListDecoder()
        guard let data = userDefault.data(forKey: key) else { return nil }
        let value = try? decoder.decode(Shopping.self, from: data)
        return value
    }
    
    static func delete(key: String) {
        userDefault.removeObject(forKey: key)
    }
}
