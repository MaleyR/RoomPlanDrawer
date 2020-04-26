//
//  Drawable.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 20.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import UIKit

protocol Drawable {
//    func draw(with context: UIGraphicsImageRendererContext)
    func draw(with layer: CALayer)
}
