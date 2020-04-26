//
//  Wall.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 19.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import CoreGraphics

class Wall: DrawableElementWithChild {
    let width: CGFloat
    
    lazy var points: [Point] = {
        return self.items.filter({ $0.elementType == .point }) as? [Point] ?? []
    }()
    
    enum CodingKeys: String, CodingKey {
        case width = "w"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.width = try container.decode(CGFloat.self, forKey: .width)
        try super.init(from: decoder)
    }
    
    
}
