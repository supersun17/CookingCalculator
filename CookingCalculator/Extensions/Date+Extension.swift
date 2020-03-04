//
//  Date+Extension.swift
//  CookingCalculator
//
//  Created by Ming Sun on 2020/1/21.
//  Copyright © 2020 Ming Sun. All rights reserved.
//

import Foundation

extension Date {
    var toISOString: String? {
        let formatter = DateFormatter()
        return formatter.string(from: self)
    }
}
