//
//  Window.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 19.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import CoreGraphics

class Window: DrawableElement {
    let x: CGFloat
    let y: CGFloat
    let sX: CGFloat
    let sY: CGFloat
    
    enum CodingKeys: String, CodingKey {
        case x
        case y
        case sX
        case sY
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.x = try container.decode(CGFloat.self, forKey: .x)
        self.y = try container.decode(CGFloat.self, forKey: .y)
        self.sX = try container.decode(CGFloat.self, forKey: .sX)
        self.sY = try container.decode(CGFloat.self, forKey: .sY)
        try super.init(from: decoder)
    }
}
