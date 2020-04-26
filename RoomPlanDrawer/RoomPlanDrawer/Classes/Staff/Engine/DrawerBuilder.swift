//
//  DrawerBuilder.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 22.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import Foundation

class DrawerBuilder {
    static func drawer<T: DrawableElement>(for item: T) -> Drawable? {
        switch item.elementType {
        case .room:
            guard let room = item as? Room else { return nil }
            return RoomDrawer(room: room)
        default:
            return nil
        }
    }
}
