//
//  ProjectsFlow.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 18.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import Foundation

class ProjectsFlow {
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
}

// MARK: - ProjectsFlowType
extension ProjectsFlow: ProjectsFlowType {
    func loadProjectInfo(projectId: String, completion: @escaping ((Projects?, RPError?) -> Void)) {
        let request = ProjectRequest(identifier: projectId)
        networkManager.performRequest(request) { (result: NetworkRequestResult<Projects>) in
            switch result {
            case .success(let object):
                completion(object, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
