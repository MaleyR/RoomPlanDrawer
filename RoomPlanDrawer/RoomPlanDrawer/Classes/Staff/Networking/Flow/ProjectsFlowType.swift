//
//  ProjectsFlowType.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 18.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import Foundation

protocol ProjectsFlowType {
    func loadProjectInfo(projectId: String, completion: @escaping ((Projects?, RPError?) -> Void))
}
