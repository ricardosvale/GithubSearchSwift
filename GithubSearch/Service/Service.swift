//
//  Service.swift
//  GithubSearch
//
//  Created by Ricardo on 07/02/25.
//

import Foundation
import Alamofire

class Service {
    
    func fetchRepositoriesGit(for username: String, completion: @escaping (Result<([Repository]), Error>) -> Void) {
        let url = "https://api.github.com/users/\(username)/repos"
        
        AF.request(url).responseDecodable(of: [Repository].self) { response in
            switch response.result {
            case .success(let repositories):
                if repositories.isEmpty == false {
                    completion(.success(repositories))
                } else {
                    let userNotFoundError = NSError(domain: "GitHubService", code: 404, userInfo: [NSLocalizedDescriptionKey: "User not found. Please enter another name"])
                    completion(.failure(userNotFoundError))
                }
                
            case .failure(let error):
                if let statusCode = response.response?.statusCode, statusCode == 404 {
                    let userNotFoundError = NSError(domain: "GitHubService", code: 404, userInfo: [NSLocalizedDescriptionKey: "User not found. Please enter another name"])
                    completion(.failure(userNotFoundError))
                    return
                } else {
                    if let afError = error.asAFError, afError.isSessionTaskError {
                        let networkError = NSError(domain: "GitHubService", code: -1009, userInfo: [NSLocalizedDescriptionKey: "A network error has occurred. Check your Internet connection and try again later."])
                        completion(.failure(networkError))
                        return
                    }
                }
            }
        }
    }
}


