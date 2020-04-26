//
//  NetworkManager.swift
//  RoomPlanDrawer
//
//  Created by Ruslan Maley on 17.04.2020.
//  Copyright © 2020 Ruslan Maley. All rights reserved.
//

import Foundation

enum NetworkRequestResult<T: Decodable> {
    case success(result: T)
    case failure(error: RPError)
}

typealias NetworkRequestResultBlock<T: Decodable> = ((NetworkRequestResult<T>) -> Void)

final class NetworkManager {
    private enum Constants {
        static let baseUrl = "https://planner5d.com/api/"
    }
    
    private let urlSession = URLSession(configuration: .default)
    
    func performRequest<T: Decodable>(_ request: NetworkRequest,
                                    completion: @escaping NetworkRequestResultBlock<T>) {
        guard let url = URL(string: Constants.baseUrl + request.path) else {
            completion(.failure(error: .url))
            return
        }
        
        let dataTask = urlSession.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error: .error(error: error)))
            } else {
                guard let data = data else {
                    completion(.failure(error: .stringError(string: "Empty response data")))
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    completion(.failure(error: .stringError(string: "Not HTTP request")))
                    return
                }
                
                guard response.statusCode == 200 else {
                    completion(.failure(error: .network(statusCode: response.statusCode)))
                    return
                }
                
                let decoder = JSONDecoder()
                
                do {
                    let object = try decoder.decode(T.self, from: data)
                    completion(.success(result: object))
                } catch let error {
                    completion(.failure(error: .error(error: error)))
                }
            }
        }
        
        dataTask.resume()
    }
}
