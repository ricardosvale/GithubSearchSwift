//
//  HomeViewModel.swift
//  GithubSearch
//
//  Created by Ricardo on 08/02/25.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var username: String  = ""
    
    private let service = Service()
    
    func fetchUser(completion: @escaping (String?) -> Void) {
        // Formatar o nome do usuário
        let formattedUsername = username.trimmingCharacters(in: .whitespacesAndNewlines) // Remover espaços e converter para minúsculas
        print("Buscando usuário: \(formattedUsername)")
        
        service.fetchRepositoriesGit(for: formattedUsername) { result in
            switch result {
            case .success(_):
                completion(nil)
            case .failure(let error):
                print("Erro ao buscar usuário: \(error.localizedDescription)")
                if let error = error as? NSError, error.code == 404 {
                    completion("Usuário não encontrado")
                } else {
                    completion(error.localizedDescription)
                }
            }
        }
    }
}
