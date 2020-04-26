//
//  ProjectDetailsViewType.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 20.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import CoreGraphics

protocol ProjectDetailsViewType: class {
    func apply(size: CGSize)
    func apply(offset: CGPoint)
}
