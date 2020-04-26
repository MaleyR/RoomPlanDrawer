//
//  Room.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 19.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import CoreGraphics

class Room: DrawableElementWithChild {
    let x: CGFloat
    let y: CGFloat
    
    lazy var walls: [Wall] = {
        return self.items.filter({ $0.elementType == .wall }) as? [Wall] ?? []
    }()
    
    var offset: CGPoint {
        return CGPoint(x: x, y: y)
    }
    
    enum CodingKeys: String, CodingKey {
        case x
        case y
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.x = try container.decode(CGFloat.self, forKey: .x)
        self.y = try container.decode(CGFloat.self, forKey: .y)
        try super.init(from: decoder)
    }
}
