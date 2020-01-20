//
//  Dependencies.swift
//  CookingCalculator
//
//  Created by Ming Sun on 2019/11/27.
//  Copyright © 2019 Ming Sun. All rights reserved.
//

import Foundation

class Dependencies {
    static let shared = Dependencies()
    lazy var ipAddressService = IPAddressService()

    private init {}
}
