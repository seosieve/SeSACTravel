//
//  SSUserDefaults.swift
//  SeSACTravel
//
//  Created by 서충원 on 5/26/24.
//

import Foundation

class SSUserDefaults {
    private static let userdefaults = UserDefaults.standard
    
    private static let SSArrayName = "SSArray"
    
    static func append(_ value: String) {
        var SSArray = userdefaults.array(forKey: SSArrayName) ?? [String]()
        SSArray.append(value)
        userdefaults.set(SSArray, forKey: SSArrayName)
    }
    
    static func set(_ value: Any?, forKey key: String) {
        self.append(key)
        userdefaults.set(value, forKey: key)
    }
    
    static func get<T>(forKey key: String) -> T? {
        return userdefaults.object(forKey: key) as? T
    }
    
    static func getAll() -> [String: Any] {
        var SSUserDefaultsOnly = [String: Any]()
        let SSArray = userdefaults.array(forKey: SSArrayName) as? [String] ?? [String]()
        for key in SSArray {
            SSUserDefaultsOnly[key] = userdefaults.object(forKey: key)
        }
        return SSUserDefaultsOnly
    }
}
