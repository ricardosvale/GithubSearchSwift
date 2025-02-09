//
//  ProfileViewModel.swift
//  GithubSearch
//
//  Created by Ricardo Silva Vale on 07/02/25.
//

import SwiftUI
import Alamofire

class ProfileViewModel: ObservableObject {
    @Published var username: String
    @Published var imageUrl: String
    @Published var repositories: [Repository] = []
    @Published var errorMessage: String?
    
    private let service = Service()
    
    init(username: String) {
        self.username = username
        self.imageUrl = ""
        fetchRepositories()
        
    }
    
    func fetchRepositories() {
        service.fetchRepositoriesGit(for: username) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let (login, avatar, repositories)):
                    self.username = login
                    self.imageUrl = avatar
                    self.repositories = repositories
                    self.errorMessage = nil
                case .failure(let error):
                    if let error = error as? NSError, error.code == 404 {
                        self.errorMessage = "Usuário não encontrado"
                    } else {
                        self.errorMessage = "Erro: \(error.localizedDescription)"
                    }
                 }
            }
        }
    }
}
