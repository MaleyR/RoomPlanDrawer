//
//  ProjectsListAssembly.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 20.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import UIKit

class ProjectsListAssembly {
    private struct Constants {
        struct Storyboard {
            static let name = "ProjectsList"
            static let viewIdentifier = "ProjectsListView"
        }
    }
    
    private static let storyboard = UIStoryboard(name: Constants.Storyboard.name,
                                                 bundle: Bundle(for: ProjectsListView.self))
    
    static func view(networkManager: NetworkManager) -> UIViewController {
        let view = storyboard.instantiateViewController(withIdentifier: Constants.Storyboard.viewIdentifier)
        
        if let requiredView = view as? ProjectsListView {
            build(view: requiredView, networkManager: networkManager)
        }
        
        return view
    }
    
    private static func build(view: ProjectsListView, networkManager: NetworkManager) {
        let router = ProjectsListRouter()
        router.source = view
        
        let projectsFlow = ProjectsFlow(networkManager: networkManager)
        let projectsLoader = ProjectsLoader(projectsFlow: projectsFlow)
        
        let presenter = ProjectsListPresenter(router: router, projectsLoader: projectsLoader)
        presenter.view = view
        
        view.presenter = presenter
    }
}
