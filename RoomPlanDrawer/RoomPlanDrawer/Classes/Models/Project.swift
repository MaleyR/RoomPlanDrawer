//
//  Project.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 19.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import CoreGraphics

class Project: DrawableElementWithChild {
    let width: CGFloat
    let height: CGFloat
    
    enum CodingKeys: String, CodingKey {
        case width
        case height
    }
    
    lazy var floors: [Floor] = {
        return self.items.filter({ $0.elementType == .floor }) as? [Floor] ?? []
    }()
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.width = try container.decode(CGFloat.self, forKey: .width)
        self.height = try container.decode(CGFloat.self, forKey: .height)
        try super.init(from: decoder)
    }
}
