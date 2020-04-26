//
//  ProjectsListRouter.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 20.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import UIKit

class ProjectsListRouter {
    weak var source: UIViewController?
}

// MARK: - ProjectsListRouterType
extension ProjectsListRouter: ProjectsListRouterType {
    func openProjectDetails(_ project: Project) {
        let view = ProjectDetailsAssembly.view(project: project)
        source?.navigationController?.pushViewController(view, animated: true)
    }
}
