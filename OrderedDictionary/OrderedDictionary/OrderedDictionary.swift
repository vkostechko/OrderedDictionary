//
//  OrderedDictionary.swift
//  OrderedDictionary
//
//  Created by Viachaslau Kastsechka on 11/12/21.
//

import Foundation

struct OrderedDictionary<T: Hashable, U> {
    private(set) var keys: [T] = []
    private(set) var values: [T: U] = [:]
    
    init() {}
    
    subscript(key: T) -> U? {
        get {
            values[key]
        }
        set(newValue) {
            guard let newValue = newValue else {
                values.removeValue(forKey: key)
                keys.removeAll { $0 == key }
                return
            }
            let oldValue = values.updateValue(newValue, forKey: key)
            if oldValue == nil {
                keys.append(key)
            }
        }
    }
    
    subscript(index: Int) -> U? {
        get {
            values[keys[index]]
        }
        set(newValue) {
            let key = keys[index]
            guard let newValue = newValue else {
                values.removeValue(forKey: key)
                keys.remove(at: index)
                return
            }
            let oldValue = values.updateValue(newValue, forKey: key)
            if oldValue == nil {
                keys.append(key)
            }
        }
    }
    
    var description: String {
        var result = "{\n"
        for (index, key) in keys.enumerated() {
            result += "[\(index)]: \(key) => \(String(describing: self[key]))\n"
        }
        result += "}"
        
        return result
    }
}
