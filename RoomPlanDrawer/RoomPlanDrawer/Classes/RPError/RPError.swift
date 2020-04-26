//
//  RPError.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 19.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import Foundation

enum RPError: Error {
    case url
    case network(statusCode: Int)
    case error(error: Error)
    case stringError(string: String)
}

extension RPError: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .url:
            return "Wrong request url format"
        case .network(let statusCode):
            return "Network status code: \(statusCode)"
        case .error(let error):
            return error.localizedDescription
        case .stringError(let string):
            return string
        }
    }
}
