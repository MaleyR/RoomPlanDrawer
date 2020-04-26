//
//  ProjectDetailsAssembly.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 20.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import UIKit

class ProjectDetailsAssembly {
    private struct Constants {
        struct Storyboard {
            static let name = "ProjectDetails"
            static let viewIdentifier = "ProjectDetailsView"
        }
    }
    
    private static let storyboard = UIStoryboard(name: Constants.Storyboard.name,
                                                 bundle: Bundle(for: ProjectDetailsView.self))
    
    static func view(project: Project) -> UIViewController {
        let view = storyboard.instantiateViewController(withIdentifier: Constants.Storyboard.viewIdentifier)
        
        if let requiredView = view as? ProjectDetailsView {
            build(view: requiredView, project: project)
        }
        
        return view
    }
    
    private static func build(view: ProjectDetailsView, project: Project) {
        let router = ProjectDetailsRouter()
        router.source = view
        
        let presenter = ProjectDetailsPresenter(router: router, project: project)
        presenter.view = view
        
        view.presenter = presenter
    }
}
