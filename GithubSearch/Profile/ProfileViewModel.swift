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
         service.fetchRepositoriesGit(for: username) { [weak self] result in
             guard let self = self else { return }
             
             DispatchQueue.main.async {
                 switch result {
                 case .success(let (_, avatar, repositories)):
                     self.imageUrl = avatar
                     self.repositories = repositories
                     self.errorMessage = nil
                 case .failure:
                     self.errorMessage = "Ocorreu um erro ao carregar os repositórios. Verifique sua conexão."
                 }
             }
         }
     }
}

