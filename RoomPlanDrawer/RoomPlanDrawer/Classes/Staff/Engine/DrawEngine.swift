//
//  DrawEngine.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 19.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import UIKit

final class DrawEngine {
    func draw(project: Project, in view: UIView) {
        draw(project, layer: view.layer)
    }
}

// MARK: - Private
private extension DrawEngine {
    func draw<T: DrawableElementWithChild>(_ element: T, layer: CALayer) {
        for item in element.items {
            if item.elementType == .room {
                let drawer = DrawerBuilder.drawer(for: item)
                drawer?.draw(with: layer)
                continue
            }

            if let itemWithChild = item as? DrawableElementWithChild {
                draw(itemWithChild, layer: layer)
            }
        }
    }
}
