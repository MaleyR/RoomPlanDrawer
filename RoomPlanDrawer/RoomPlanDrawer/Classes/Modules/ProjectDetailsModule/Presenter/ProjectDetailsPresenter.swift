//
//  ProjectDetailsPresenter.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 20.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import Foundation
import UIKit

class ProjectDetailsPresenter {
    private let router: ProjectDetailsRouterType
    private let project: Project
    
    weak var view: ProjectDetailsViewType?
    
    init(router: ProjectDetailsRouterType, project: Project) {
        self.router = router
        self.project = project
    }
}

// MARK: - ProjectDetailsPresenterType
extension ProjectDetailsPresenter: ProjectDetailsPresenterType {
    func viewDidLoad(_ view: ProjectDetailsViewType, baseView: UIView) {
        let drawEngine = DrawEngine()
        drawEngine.draw(project: project, in: baseView)
        view.apply(size: CGSize(width: project.width, height: project.height))
    }
    
    func viewWillAppear(_ view: ProjectDetailsViewType) {
        view.apply(offset: planCenterPoint())
    }
}

// MARK: - Private
private extension ProjectDetailsPresenter {
    func planCenterPoint() -> CGPoint {
        guard let floors = project.items as? [Floor] else { return .zero }
        
        for floor in floors {
            guard let rooms = floor.items.filter({ $0.elementType == .room }) as? [Room] else { return .zero }
            
            guard let minX = rooms.min(by: { $0.x < $1.x })?.x,
                let maxX = rooms.max(by: { $0.x < $1.x })?.x,
                let minY = rooms.min(by: { $0.y < $1.y })?.y,
                let maxY = rooms.max(by: { $0.y < $1.y })?.y else { return .zero }
            
            let midX = minX + (maxX - minX) / 2
            let midY = minY + (maxY - minY) / 2
            
            return CGPoint(x: midX, y: midY)
        }
        
        return .zero
    }
}
