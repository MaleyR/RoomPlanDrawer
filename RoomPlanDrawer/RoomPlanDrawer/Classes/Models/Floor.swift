//
//  Floor.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 19.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import Foundation

class Floor: DrawableElementWithChild {
    let name: String
    
    lazy var rooms: [Room] = {
        return self.items.filter({ $0.elementType == .room }) as? [Room] ?? []
    }()
    
    enum CodingKeys: String, CodingKey {
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        try super.init(from: decoder)
    }
}
