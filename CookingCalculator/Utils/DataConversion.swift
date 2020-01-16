//
//  DataConversion.swift
//  CookingCalculator
//
//  Created by Ming Sun on 2020/1/15.
//  Copyright © 2020 Ming Sun. All rights reserved.
//

import Foundation

class DataConversion {
    static func encode<T: Encodable>(_ source: T?) -> Data? {
        guard let source = source,
              let data = try? JSONEncoder().encode(source) else {
                return nil
        }
        return data
    }

    static func decode<T: Decodable>(_ data: Data?) -> T? {
        guard let data = data,
            let stuff = try? JSONDecoder().decode(T.self, from: data) else {
                return nil
        }
        return stuff
    }
}
