//
//  ProjectRequest.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 18.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import Foundation

struct ProjectRequest: NetworkRequest {
    var path: String {
        return "project/\(identifier)"
    }
    
    let identifier: String
}
