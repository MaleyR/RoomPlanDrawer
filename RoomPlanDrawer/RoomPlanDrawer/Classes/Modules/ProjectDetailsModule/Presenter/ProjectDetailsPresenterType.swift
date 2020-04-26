//
//  ProjectDetailsPresenterType.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 20.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import UIKit

protocol ProjectDetailsPresenterType {
    func viewDidLoad(_ view: ProjectDetailsViewType, baseView: UIView)
    func viewWillAppear(_ view: ProjectDetailsViewType)
}
