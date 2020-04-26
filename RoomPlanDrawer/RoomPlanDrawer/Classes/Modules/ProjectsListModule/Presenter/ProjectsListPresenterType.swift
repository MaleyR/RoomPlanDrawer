//
//  ProjectsListPresenterType.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 20.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import Foundation

protocol ProjectsListPresenterType {
    func viewDidLoad(_ view: ProjectsListViewType)
    func viewDidSelect(_ view: ProjectsListViewType, index: Int)
}
