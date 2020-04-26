//
//  ProjectsListPresenter.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 20.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import Foundation

struct Row {
    let title: String
}

class ProjectsListPresenter {
    private let router: ProjectsListRouterType
    private let projectsLoader: ProjectsLoaderType
    
    private var projects: [ProjectItem] = []
    
    weak var view: ProjectsListViewType?
    
    init(router: ProjectsListRouterType, projectsLoader: ProjectsLoaderType) {
        self.router = router
        self.projectsLoader = projectsLoader
    }
}

// MARK: - ProjectsListPresenterType
extension ProjectsListPresenter: ProjectsListPresenterType {
    func viewDidLoad(_ view: ProjectsListViewType) {
        view.updateLoadingIndicator(isVisible: true)
        projectsLoader.loadProjects { [weak self] (projects) in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.view?.updateLoadingIndicator(isVisible: false)
                self.projects = projects.sorted(by: { $0.name < $1.name })
                self.view?.apply(rows: self.buildRows(for: self.projects))
            }
        }
    }
    
    func viewDidSelect(_ view: ProjectsListViewType, index: Int) {
        let project = projects[index]
        router.openProjectDetails(project.data)
    }
}

// MARK: - Private
private extension ProjectsListPresenter {
    func buildRows(for projects: [ProjectItem]) -> [Row] {
        var rows: [Row] = []
        
        for project in projects {
            rows.append(Row(title: project.name))
        }
        
        return rows
    }
}
