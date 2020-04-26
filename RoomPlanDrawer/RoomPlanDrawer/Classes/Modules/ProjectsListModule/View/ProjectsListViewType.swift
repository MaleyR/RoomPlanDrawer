//
//  ProjectsListViewType.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 20.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import Foundation

protocol ProjectsListViewType: class, LoadableView {
    func apply(rows: [Row])
}
