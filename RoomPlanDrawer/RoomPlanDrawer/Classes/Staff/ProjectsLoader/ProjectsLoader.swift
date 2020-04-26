//
//  ProjectsLoader.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 20.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import Foundation

class ProjectsLoader {
    private struct Constants {
        struct Hashes {
            static let hash1 = "bc150ea56d0f8f0896337154543136d7"
            static let hash2 = "f47a1763c2149eaf714c05fba310c342"
            static let hash3 = "11dda46aee205807f0a1c4c3e1002c0c"
            static let hash4 = "5223bd1bf0d8232b312edbe254ece79a"
            
            static var allHashes: [String] = [Hashes.hash1, Hashes.hash2, Hashes.hash3, Hashes.hash4]
        }
    }
    
    private let projectsFlow: ProjectsFlowType
    
    init(projectsFlow: ProjectsFlowType) {
        self.projectsFlow = projectsFlow
    }
}

// MARK: - ProjectsLoaderType
extension ProjectsLoader: ProjectsLoaderType {
    func loadProjects(completion: @escaping (([ProjectItem]) -> Void)) {
        var projects: [ProjectItem] = []
        
        let group = DispatchGroup()
        let queue = DispatchQueue.global(qos: .background)
        
        for hash in Constants.Hashes.allHashes {
            group.enter()
            queue.async(group: group) {
                self.projectsFlow.loadProjectInfo(projectId: hash) { (project, error) in
                    guard let project = project else { return }
                    projects.append(contentsOf: project.items)
                    group.leave()
                }
            }
        }
        
        group.notify(queue: queue) {
            queue.async {
                completion(projects)
            }
        }
    }
}
