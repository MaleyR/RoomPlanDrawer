//
//  DrawableElementWithChild.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 19.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import Foundation

class DrawableElementWithChild: DrawableElement {
    let items: [DrawableElement]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    enum ElementClassNameKey: CodingKey {
        case className
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        var items: [DrawableElement] = []
        
        var itemsContainer = try container.nestedUnkeyedContainer(forKey: .items)
        
        var itemsArray = itemsContainer
        
        while !itemsContainer.isAtEnd {
            let item = try itemsContainer.nestedContainer(keyedBy: ElementClassNameKey.self)
            let type = try item.decode(DrawableElementType.self, forKey: .className)
            
            switch type {
            case .floor:
                items.append(try itemsArray.decode(Floor.self))
            case .point:
                items.append(try itemsArray.decode(Point.self))
            case .room:
                items.append(try itemsArray.decode(Room.self))
            case .wall:
                items.append(try itemsArray.decode(Wall.self))
            case .window:
                items.append(try itemsArray.decode(Window.self))
            default:
                break
            }
        }
        
        self.items = items
        
        try super.init(from: decoder)
    }
}
