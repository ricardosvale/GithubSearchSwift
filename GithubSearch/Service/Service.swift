//
//  Service.swift
//  GithubSearch
//
//  Created by Ricardo on 07/02/25.
//

import Foundation
import Alamofire

class Service {
    
    func fetchRepositoriesGit(for username: String, completion: @escaping (Result<(String, String, [Repository]), Error>) -> Void) {
        let url = "https://api.github.com/users/\(username)/repos"
        
        AF.request(url).responseDecodable(of: [Repository].self) { response in
            switch response.result {
            case .success(let repositories):
                guard let owner = repositories.first?.owner else {
                    completion(.failure(NSError(domain: "GitHubService", code: 404, userInfo: [NSLocalizedDescriptionKey: "Nenhum repositório encontrado"])))
                    return
                }
                completion(.success((owner.login, owner.avatar_url, repositories)))
                
            case .failure(let error):
                if let statusCode = response.response?.statusCode, statusCode == 404 {
                    let userNotFoundError = NSError(domain: "GitHubService", code: 404, userInfo: [NSLocalizedDescriptionKey: "Usuário não encontrado"])
                    completion(.failure(userNotFoundError))
                    return
                } else {
                    completion(.failure(error))
                }
            }
        }
    }
}


