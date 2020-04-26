//
//  DrawableElement.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 19.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import Foundation

enum DrawableElementType: String, Decodable {
    case project = "Project"
    case floor = "Floor"
    case room = "Room"
    case wall = "Wall"
    case point = "Point"
    case window = "Window"
    case ns = "Ns"
}

class DrawableElement: Decodable {
    let elementType: DrawableElementType
    
    enum CodingKeys: String, CodingKey {
        case className
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.elementType = try container.decode(DrawableElementType.self, forKey: .className)
    }
}
